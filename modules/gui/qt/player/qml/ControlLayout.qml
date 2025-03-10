﻿/*****************************************************************************
 * Copyright (C) 2019 VLC authors and VideoLAN
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * ( at your option ) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
 *****************************************************************************/
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtQml.Models 2.11

import org.videolan.vlc 0.1

import "qrc:///style/"
import "qrc:///widgets/" as Widgets

FocusScope {
    id: controlLayout

    property alias model: repeater.model

    readonly property real minimumWidth: {
        var minimumWidth = 0
        var count = repeater.count

        for (var i = 0; i < count; ++i) {
            var item = repeater.itemAt(i)

            if (item.minimumWidth !== undefined)
                minimumWidth += item.minimumWidth
            else
                minimumWidth += item.implicitWidth
        }

        minimumWidth += ((count - 1) * playerControlLayout.spacing)

        return minimumWidth
    }

    property bool rightAligned: false

    Navigation.navigable: {
        for (var i = 0; i < repeater.count; ++i) {
            if (repeater.itemAt(i).item.focus) {
                return true
            }
        }
        return false
    }

    implicitWidth: minimumWidth
    implicitHeight: rowLayout.implicitHeight

    property var altFocusAction: Navigation.defaultNavigationUp

    function _handleFocus() {
        if (typeof activeFocus === "undefined")
            return

        if (activeFocus && (!visible || model.count === 0))
            altFocusAction()
    }

    Component.onCompleted: {
        visibleChanged.connect(_handleFocus)
        activeFocusChanged.connect(_handleFocus)
    }

    RowLayout {
        id: rowLayout

        anchors.fill: parent

        spacing: 0

        Item {
            Layout.fillWidth: rightAligned
        }

        Repeater {
            id: repeater

            onItemRemoved: {
                item.recoverFocus(index)
            }

            delegate: Loader {
                id: loader

                source: PlayerControlbarControls.control(model.id).source

                focus: (index === 0)

                Layout.alignment: Qt.AlignVCenter | (rightAligned ? Qt.AlignRight : Qt.AlignLeft)
                Layout.minimumWidth: minimumWidth
                Layout.fillWidth: expandable
                Layout.maximumWidth: item.implicitWidth
                // This is a workaround of not using RowLayout's built-in `spacing`
                // RowLayout adds an unwanted spacing at the end of the layout so
                // this is used instead.
                Layout.rightMargin: {
                    for (var i = index + 1; i < repeater.count; ++i) {
                        var item = repeater.itemAt(i)
                        if (!!item && item.visible)
                            return playerControlLayout.spacing
                    }
                    return 0
                }

                readonly property real minimumWidth: (expandable ? item.minimumWidth : item.implicitWidth)
                readonly property bool expandable: (item.minimumWidth !== undefined)

                Binding {
                    delayed: true // this is important
                    target: loader
                    property: "visible"
                    value: (loader.x + minimumWidth <= rowLayout.width)
                }

                function buildFocusChain() {
                    // rebuild the focus chain:
                    if (typeof repeater === "undefined")
                        return

                    var rightItem = repeater.itemAt(index + 1)
                    var leftItem = repeater.itemAt(index - 1)

                    item.Navigation.rightItem = !!rightItem ? rightItem.item : null
                    item.Navigation.leftItem = !!leftItem ? leftItem.item : null
                }

                Component.onCompleted: {
                    repeater.countChanged.connect(loader.buildFocusChain)
                    repeater.modelChanged.connect(loader.buildFocusChain)
                    repeater.countChanged.connect(controlLayout._handleFocus)
                }

                onActiveFocusChanged: {
                    if (activeFocus && (!!item && !item.focus)) {
                        recoverFocus()
                    }
                }

                Connections {
                    target: item

                    enabled: loader.status === Loader.Ready

                    onEnabledChanged: {
                        if (activeFocus && !item.enabled) // Loader has focus but item is not enabled
                            recoverFocus()
                    }

                    onVisibleChanged: {
                        if (activeFocus && !item.visible)
                            recoverFocus()
                    }
                }

                onLoaded: {
                    // control should not request focus if they are not enabled:
                    item.focus = Qt.binding(function() { return item.enabled && item.visible })

                    // navigation parent of control is always controlLayout
                    // so it can be set here unlike leftItem and rightItem:
                    item.Navigation.parentItem = controlLayout

                    if (item instanceof Widgets.IconToolButton)
                        item.size = Qt.binding(function() { return defaultSize; })

                    // force colors:
                    if (!!colors && !!item.colors) {
                        item.colors = Qt.binding(function() { return colors; })
                    }

                    item.width = Qt.binding(function() { return loader.width } )

                    item.visible = Qt.binding(function() { return loader.visible })
                }

                function _focusIfFocusable(_loader) {
                    if (!!_loader && !!_loader.item && _loader.item.focus) {
                        if (item.focusReason !== undefined)
                            _loader.item.forceActiveFocus(item.focusReason)
                        else {
                            console.warn("focusReason is not available in %1!".arg(item))
                            _loader.item.forceActiveFocus()
                        }
                        return true
                    } else {
                        return false
                    }
                }

                function recoverFocus(_index) {
                    if (!controlLayout.visible)
                        return

                    if (_index === undefined)
                        _index = index

                    for (var i = 1; i <= Math.max(_index, repeater.count - (_index + 1)); ++i) {
                         if (i <= _index) {
                             var leftItem = repeater.itemAt(_index - i)

                             if (_focusIfFocusable(leftItem))
                                 return
                         }

                         if (_index + i <= repeater.count - 1) {
                             var rightItem = repeater.itemAt(_index + i)

                             if (_focusIfFocusable(rightItem))
                                 return
                         }
                    }

                    // focus to other alignment if focusable control
                    // in the same alignment is not found:
                    if (!!controlLayout.Navigation.rightItem) {
                        controlLayout.Navigation.defaultNavigationRight()
                    } else if (!!controlLayout.Navigation.leftItem) {
                        controlLayout.Navigation.defaultNavigationLeft()
                    } else {
                        controlLayout.altFocusAction()
                    }
                }
            }
        }

        Item {
            Layout.fillWidth: !rightAligned
        }
    }
}
