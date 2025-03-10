## Howto
# For each Q_OBJECT:
#   - Add *.moc.cpp to nodist_..._SOURCES
#   - Add *.cpp to ..._SOURCES
#   - Add *.hpp to ..._SOURCES
# For each UI
#   - Add *.ui to ..._UI
#   - Add *.h to nodist_..._SOURCES
# For each resource (icon, png, ...)
#   - Add it to DEPS_res
# For each qml and js resource
#   - Add it to ..._QML

SUFFIXES += .ui .h .hpp .moc.cpp .qml

libqt_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) \
	-I$(srcdir)/gui/qt -I$(builddir)/gui/qt/ \
	-I$(builddir)/gui/qt/dialogs/extended \
	-I$(builddir)/gui/qt/dialogs/fingerprint \
	-I$(builddir)/gui/qt/dialogs/firstrun \
	-I$(builddir)/gui/qt/dialogs/help \
	-I$(builddir)/gui/qt/dialogs/messages \
	-I$(builddir)/gui/qt/dialogs/open \
	-I$(builddir)/gui/qt/dialogs/podcast \
	-I$(builddir)/gui/qt/dialogs/preferences \
	-I$(builddir)/gui/qt/dialogs/sout \
	-I$(builddir)/gui/qt/dialogs/vlm

libqt_plugin_la_CXXFLAGS = $(AM_CXXFLAGS) $(QT_CFLAGS) $(CXXFLAGS_qt)
libqt_plugin_la_LIBADD = $(QT_LIBS) $(LIBS_qt) $(LIBM)
libqt_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(guidir)'
if HAVE_DARWIN
libqt_plugin_la_LDFLAGS += -Wl,-framework,Cocoa
endif
if HAVE_QT5_X11
libqt_plugin_la_CXXFLAGS += $(QT5_X11_CFLAGS) -DQT5_HAS_X11
libqt_plugin_la_LIBADD += $(QT5_X11_LIBS) $(X_LIBS) $(X_PRE_LIB) -lX11
endif

if HAVE_XCB
libqt_plugin_la_CXXFLAGS += -DQT5_HAS_XCB $(XCB_CFLAGS)
libqt_plugin_la_LIBADD += $(XCB_LIBS)
if HAVE_XCB_DAMAGE
libqt_plugin_la_CXXFLAGS += -DQT5_HAS_X11_COMPOSITOR \
        $(XCB_RENDER_CFLAGS) $(XCB_COMPOSITE_CFLAGS) $(XLCB_DAMAGE_CFLAGS)
libqt_plugin_la_LIBADD += $(XCB_RENDER_LIBS) $(XCB_COMPOSITE_LIBS) $(XCB_DAMAGE_LIBS)
endif
endif

if HAVE_WAYLAND
libqt_plugin_la_CPPFLAGS += -DQT5_HAS_WAYLAND \
	-DQPNI_HEADER=\<$(QT_VERSION)/QtGui/qpa/qplatformnativeinterface.h\>
libqt_plugin_la_CXXFLAGS += $(WAYLAND_CLIENT_CFLAGS)
libqt_plugin_la_LIBADD += $(WAYLAND_CLIENT_LIBS)
endif
if HAVE_WIN32
libqt_plugin_la_LIBADD += $(LIBCOM) -lcomctl32 -luuid -ld3d11
endif
if UPDATE_CHECK
libqt_plugin_la_CPPFLAGS += -DUPDATE_CHECK
endif
if QT_QML_DEBUG
libqt_plugin_la_CPPFLAGS += -DQT_QML_DEBUG
endif

libqt_plugin_la_SOURCES = \
	gui/qt/qt.cpp gui/qt/qt.hpp \
	gui/qt/dialogs/bookmarks/bookmarks.cpp gui/qt/dialogs/bookmarks/bookmarks.hpp \
	gui/qt/dialogs/dialogs/dialogmodel.cpp \
	gui/qt/dialogs/dialogs/dialogmodel.hpp \
	gui/qt/dialogs/dialogs_provider.cpp gui/qt/dialogs/dialogs_provider.hpp \
	gui/qt/dialogs/epg/EPGChannels.cpp \
	gui/qt/dialogs/epg/EPGChannels.hpp \
	gui/qt/dialogs/epg/EPGItem.cpp \
	gui/qt/dialogs/epg/EPGItem.hpp \
	gui/qt/dialogs/epg/EPGProgram.cpp \
	gui/qt/dialogs/epg/EPGProgram.hpp \
	gui/qt/dialogs/epg/EPGRuler.cpp gui/qt/dialogs/epg/EPGRuler.hpp \
	gui/qt/dialogs/epg/EPGView.cpp gui/qt/dialogs/epg/EPGView.hpp \
	gui/qt/dialogs/epg/EPGWidget.cpp \
	gui/qt/dialogs/epg/EPGWidget.hpp \
	gui/qt/dialogs/epg/epg.cpp gui/qt/dialogs/epg/epg.hpp \
	gui/qt/dialogs/errors/errors.cpp gui/qt/dialogs/errors/errors.hpp \
	gui/qt/dialogs/extended/extended.cpp gui/qt/dialogs/extended/extended.hpp \
	gui/qt/dialogs/extended/extended_panels.cpp \
	gui/qt/dialogs/extended/extended_panels.hpp \
	gui/qt/dialogs/extensions/extensions.cpp gui/qt/dialogs/extensions/extensions.hpp \
	gui/qt/dialogs/extensions/extensions_manager.cpp gui/qt/dialogs/extensions/extensions_manager.hpp \
	gui/qt/dialogs/fingerprint/chromaprint.cpp \
	gui/qt/dialogs/fingerprint/chromaprint.hpp \
	gui/qt/dialogs/fingerprint/fingerprintdialog.cpp \
	gui/qt/dialogs/fingerprint/fingerprintdialog.hpp \
	gui/qt/dialogs/firstrun/firstrunwizard.cpp gui/qt/dialogs/firstrun/firstrunwizard.hpp \
	gui/qt/dialogs/gototime/gototime.cpp gui/qt/dialogs/gototime/gototime.hpp \
	gui/qt/dialogs/help/aboutmodel.cpp \
	gui/qt/dialogs/help/aboutmodel.hpp \
	gui/qt/dialogs/help/help.cpp gui/qt/dialogs/help/help.hpp \
	gui/qt/dialogs/mediainfo/info_panels.cpp gui/qt/dialogs/mediainfo/info_panels.hpp \
	gui/qt/dialogs/mediainfo/info_widgets.cpp gui/qt/dialogs/mediainfo/info_widgets.hpp \
	gui/qt/dialogs/mediainfo/mediainfo.cpp gui/qt/dialogs/mediainfo/mediainfo.hpp \
	gui/qt/dialogs/messages/messages.cpp gui/qt/dialogs/messages/messages.hpp \
	gui/qt/dialogs/open/open.cpp gui/qt/dialogs/open/open.hpp \
	gui/qt/dialogs/open/open_panels.cpp gui/qt/dialogs/open/open_panels.hpp \
	gui/qt/dialogs/open/openurl.cpp gui/qt/dialogs/open/openurl.hpp \
	gui/qt/dialogs/plugins/addons_manager.cpp gui/qt/dialogs/plugins/addons_manager.hpp \
	gui/qt/dialogs/plugins/plugins.cpp gui/qt/dialogs/plugins/plugins.hpp \
	gui/qt/dialogs/podcast/podcast_configuration.cpp \
	gui/qt/dialogs/podcast/podcast_configuration.hpp \
	gui/qt/dialogs/preferences/complete_preferences.cpp \
	gui/qt/dialogs/preferences/complete_preferences.hpp \
	gui/qt/dialogs/preferences/preferences.cpp \
	gui/qt/dialogs/preferences/preferences.hpp \
	gui/qt/dialogs/preferences/preferences_widgets.cpp \
	gui/qt/dialogs/preferences/preferences_widgets.hpp \
	gui/qt/dialogs/preferences/simple_preferences.cpp \
	gui/qt/dialogs/preferences/simple_preferences.hpp \
	gui/qt/dialogs/sout/convert.cpp gui/qt/dialogs/sout/convert.hpp \
	gui/qt/dialogs/sout/profile_selector.cpp \
	gui/qt/dialogs/sout/profile_selector.hpp \
	gui/qt/dialogs/sout/profiles.hpp \
	gui/qt/dialogs/sout/sout.cpp gui/qt/dialogs/sout/sout.hpp \
	gui/qt/dialogs/sout/sout_widgets.cpp \
	gui/qt/dialogs/sout/sout_widgets.hpp \
	gui/qt/dialogs/toolbar/controlbar_profile.hpp \
	gui/qt/dialogs/toolbar/controlbar_profile.cpp \
	gui/qt/dialogs/toolbar/controlbar_profile_model.cpp \
	gui/qt/dialogs/toolbar/controlbar_profile_model.hpp \
	gui/qt/dialogs/vlm/vlm.cpp gui/qt/dialogs/vlm/vlm.hpp \
	gui/qt/dialogs/playlists/playlists.cpp gui/qt/dialogs/playlists/playlists.hpp \
	gui/qt/maininterface/compositor.hpp \
	gui/qt/maininterface/compositor.cpp \
	gui/qt/maininterface/compositor_dummy.hpp \
	gui/qt/maininterface/compositor_dummy.cpp \
	gui/qt/maininterface/interface_window_handler.cpp \
	gui/qt/maininterface/interface_window_handler.hpp \
	gui/qt/maininterface/mainctx.cpp \
	gui/qt/maininterface/mainctx.hpp \
	gui/qt/maininterface/mainui.cpp \
	gui/qt/maininterface/mainui.hpp \
	gui/qt/maininterface/videosurface.cpp \
	gui/qt/maininterface/videosurface.hpp \
	gui/qt/maininterface/video_window_handler.cpp \
	gui/qt/maininterface/video_window_handler.hpp \
	gui/qt/medialibrary/medialib.cpp \
	gui/qt/medialibrary/medialib.hpp \
	gui/qt/medialibrary/mlalbum.cpp \
	gui/qt/medialibrary/mlalbum.hpp \
	gui/qt/medialibrary/mlalbummodel.cpp \
	gui/qt/medialibrary/mlalbummodel.hpp \
	gui/qt/medialibrary/mlalbumtrack.cpp \
	gui/qt/medialibrary/mlalbumtrack.hpp \
	gui/qt/medialibrary/mlalbumtrackmodel.cpp \
	gui/qt/medialibrary/mlalbumtrackmodel.hpp \
	gui/qt/medialibrary/mlartist.cpp \
	gui/qt/medialibrary/mlartist.hpp \
	gui/qt/medialibrary/mlartistmodel.cpp \
	gui/qt/medialibrary/mlartistmodel.hpp \
	gui/qt/medialibrary/mlbasemodel.cpp \
	gui/qt/medialibrary/mlbasemodel.hpp \
	gui/qt/medialibrary/mlbookmarkmodel.cpp \
	gui/qt/medialibrary/mlbookmarkmodel.hpp \
	gui/qt/medialibrary/mlevent.hpp \
	gui/qt/medialibrary/mlfoldersmodel.cpp \
	gui/qt/medialibrary/mlfoldersmodel.hpp \
	gui/qt/medialibrary/mlgenre.cpp \
	gui/qt/medialibrary/mlgenre.hpp \
	gui/qt/medialibrary/mlgenremodel.cpp \
	gui/qt/medialibrary/mlgenremodel.hpp \
	gui/qt/medialibrary/mlgroup.cpp \
	gui/qt/medialibrary/mlgroup.hpp \
	gui/qt/medialibrary/mlgrouplistmodel.cpp \
	gui/qt/medialibrary/mlgrouplistmodel.hpp \
	gui/qt/medialibrary/mlhelper.cpp \
	gui/qt/medialibrary/mlhelper.hpp \
	gui/qt/medialibrary/mlitemcover.cpp \
	gui/qt/medialibrary/mlitemcover.hpp \
	gui/qt/medialibrary/mllistcache.cpp \
	gui/qt/medialibrary/mllistcache.hpp \
	gui/qt/medialibrary/mlthreadpool.cpp \
	gui/qt/medialibrary/mlthreadpool.hpp \
	gui/qt/medialibrary/mlqmltypes.hpp \
	gui/qt/medialibrary/mlqueryparams.cpp \
	gui/qt/medialibrary/mlqueryparams.hpp \
	gui/qt/medialibrary/mlrecentsmodel.cpp \
	gui/qt/medialibrary/mlrecentsmodel.hpp \
	gui/qt/medialibrary/mlrecentsvideomodel.cpp \
	gui/qt/medialibrary/mlrecentsvideomodel.hpp \
	gui/qt/medialibrary/mlurlmodel.cpp \
	gui/qt/medialibrary/mlurlmodel.hpp \
	gui/qt/medialibrary/mlvideo.cpp \
	gui/qt/medialibrary/mlvideo.hpp \
	gui/qt/medialibrary/mlvideomodel.cpp \
	gui/qt/medialibrary/mlvideomodel.hpp \
	gui/qt/medialibrary/mlplaylist.cpp \
	gui/qt/medialibrary/mlplaylist.hpp \
	gui/qt/medialibrary/mlplaylistlistmodel.cpp \
	gui/qt/medialibrary/mlplaylistlistmodel.hpp \
	gui/qt/medialibrary/mlplaylistmedia.cpp \
	gui/qt/medialibrary/mlplaylistmedia.hpp \
	gui/qt/medialibrary/mlplaylistmodel.cpp \
	gui/qt/medialibrary/mlplaylistmodel.hpp \
	gui/qt/menus/custom_menus.cpp \
	gui/qt/menus/custom_menus.hpp \
	gui/qt/menus/qml_menu_wrapper.cpp \
	gui/qt/menus/qml_menu_wrapper.hpp \
	gui/qt/menus/menus.cpp gui/qt/menus/menus.hpp \
	gui/qt/network/networkdevicemodel.cpp \
	gui/qt/network/networkdevicemodel.hpp \
	gui/qt/network/networksourcesmodel.cpp \
	gui/qt/network/networksourcesmodel.hpp \
	gui/qt/network/networkmediamodel.cpp \
	gui/qt/network/networkmediamodel.hpp \
	gui/qt/network/networksourcelistener.cpp \
	gui/qt/network/networksourcelistener.hpp \
	gui/qt/network/servicesdiscoverymodel.cpp \
	gui/qt/network/servicesdiscoverymodel.hpp \
	gui/qt/player/input_models.cpp gui/qt/player/input_models.hpp \
	gui/qt/player/player_controller.cpp gui/qt/player/player_controller.hpp gui/qt/player/player_controller_p.hpp \
	gui/qt/player/player_controlbar_model.cpp gui/qt/player/player_controlbar_model.hpp \
	gui/qt/player/control_list_model.cpp gui/qt/player/control_list_model.hpp \
	gui/qt/playlist/media.hpp \
	gui/qt/playlist/playlist_common.cpp \
	gui/qt/playlist/playlist_common.hpp \
	gui/qt/playlist/playlist_controller.cpp \
	gui/qt/playlist/playlist_controller.hpp \
	gui/qt/playlist/playlist_controller_p.hpp \
	gui/qt/playlist/playlist_item.cpp \
	gui/qt/playlist/playlist_item.hpp \
	gui/qt/playlist/playlist_model.cpp \
	gui/qt/playlist/playlist_model.hpp \
	gui/qt/playlist/playlist_model_p.hpp \
	gui/qt/util/asynctask.hpp \
	gui/qt/util/audio_device_model.cpp  \
	gui/qt/util/audio_device_model.hpp \
	gui/qt/util/color_scheme_model.cpp gui/qt/util/color_scheme_model.hpp \
	gui/qt/util/covergenerator.cpp \
	gui/qt/util/covergenerator.hpp \
	gui/qt/util/imageluminanceextractor.cpp gui/qt/util/imageluminanceextractor.hpp \
	gui/qt/util/imagehelper.cpp gui/qt/util/imagehelper.hpp \
	gui/qt/util/i18n.cpp gui/qt/util/i18n.hpp \
	gui/qt/util/keyhelper.cpp gui/qt/util/keyhelper.hpp \
	gui/qt/util/listcacheloader.hpp \
	gui/qt/util/navigation_history.cpp gui/qt/util/navigation_history.hpp \
	gui/qt/util/item_key_event_filter.cpp \
	gui/qt/util/item_key_event_filter.hpp \
	gui/qt/util/flickable_scroll_handler.cpp \
	gui/qt/util/flickable_scroll_handler.hpp \
	gui/qt/util/qt_dirs.cpp gui/qt/util/qt_dirs.hpp \
	gui/qt/util/qvlcapp.hpp \
	gui/qt/util/proxycolumnmodel.hpp \
	gui/qt/util/registry.cpp gui/qt/util/registry.hpp \
	gui/qt/util/renderer_manager.cpp gui/qt/util/renderer_manager.hpp \
	gui/qt/util/selectable_list_model.cpp \
	gui/qt/util/selectable_list_model.hpp \
	gui/qt/util/singleton.hpp \
	gui/qt/util/sortfilterproxymodel.cpp \
	gui/qt/util/sortfilterproxymodel.hpp \
	gui/qt/util/soutchain.cpp gui/qt/util/soutchain.hpp \
	gui/qt/util/systempalette.cpp gui/qt/util/systempalette.hpp \
	gui/qt/util/validators.cpp gui/qt/util/validators.hpp \
	gui/qt/util/varcommon_p.hpp \
	gui/qt/util/varchoicemodel.cpp  gui/qt/util/varchoicemodel.hpp \
	gui/qt/util/variables.cpp gui/qt/util/variables.hpp \
	gui/qt/util/vlctick.cpp \
	gui/qt/util/vlctick.hpp \
	gui/qt/util/qmlinputitem.hpp \
	gui/qt/util/mouse_event_filter.cpp \
	gui/qt/util/mouse_event_filter.hpp \
	gui/qt/widgets/native/animators.cpp \
	gui/qt/widgets/native/animators.hpp \
	gui/qt/widgets/native/customwidgets.cpp gui/qt/widgets/native/customwidgets.hpp \
	gui/qt/widgets/native/interface_widgets.cpp \
	gui/qt/widgets/native/interface_widgets.hpp \
	gui/qt/widgets/native/navigation_attached.cpp \
	gui/qt/widgets/native/navigation_attached.hpp \
	gui/qt/widgets/native/mlfolderseditor.cpp \
	gui/qt/widgets/native/mlfolderseditor.hpp \
	gui/qt/widgets/native/qvlcframe.cpp \
	gui/qt/widgets/native/qvlcframe.hpp \
	gui/qt/widgets/native/roundimage.cpp gui/qt/widgets/native/roundimage.hpp \
	gui/qt/widgets/native/searchlineedit.cpp gui/qt/widgets/native/searchlineedit.hpp
if HAVE_WIN32
libqt_plugin_la_SOURCES += \
	gui/qt/maininterface/mainctx_win32.cpp \
	gui/qt/maininterface/mainctx_win32.hpp \
	gui/qt/maininterface/compositor_win7.cpp \
	gui/qt/maininterface/compositor_win7.hpp

if HAVE_DCOMP
libqt_plugin_la_SOURCES += \
	gui/qt/maininterface/compositor_dcomp.cpp \
	gui/qt/maininterface/compositor_dcomp.hpp \
	gui/qt/maininterface/compositor_dcomp_error.hpp \
	gui/qt/maininterface/compositor_dcomp_acrylicsurface.hpp \
	gui/qt/maininterface/compositor_dcomp_acrylicsurface.cpp \
	gui/qt/maininterface/compositor_dcomp_uisurface.cpp \
	gui/qt/maininterface/compositor_dcomp_uisurface.hpp
endif

endif

if HAVE_XCB
if HAVE_XCB_DAMAGE
libqt_plugin_la_SOURCES += \
	gui/qt/maininterface/compositor_x11.cpp \
	gui/qt/maininterface/compositor_x11.hpp \
	gui/qt/maininterface/compositor_x11_renderclient.cpp \
	gui/qt/maininterface/compositor_x11_renderclient.hpp \
	gui/qt/maininterface/compositor_x11_renderwindow.cpp \
	gui/qt/maininterface/compositor_x11_renderwindow.hpp \
	gui/qt/maininterface/compositor_x11_uisurface.cpp \
	gui/qt/maininterface/compositor_x11_uisurface.hpp \
	gui/qt/maininterface/compositor_x11_utils.cpp \
	gui/qt/maininterface/compositor_x11_utils.hpp
endif
endif

# Meta-object compilation

moc_verbose = $(moc_verbose_$(V))
moc_verbose_ = $(moc_verbose__$(AM_DEFAULT_VERBOSITY))
moc_verbose_0 = @echo "  MOC   " $@;
moc_verbose__0 = $(moc_verbose_0)

.hpp.moc.cpp:
	$(moc_verbose)$(MOC) $(MOC_CPPFLAGS) -o $@ $<

# These MOC files depend on the configure settings:
dialogs/dialogs_provider.moc.cpp dialogs/vlm/vlm.moc.cpp: $(top_builddir)/config.h

nodist_libqt_plugin_la_SOURCES = \
	gui/qt/dialogs/bookmarks/bookmarks.moc.cpp \
	gui/qt/dialogs/dialogs/dialogmodel.moc.cpp \
	gui/qt/dialogs/dialogs_provider.moc.cpp \
	gui/qt/dialogs/epg/EPGChannels.moc.cpp \
	gui/qt/dialogs/epg/EPGProgram.moc.cpp \
	gui/qt/dialogs/epg/EPGRuler.moc.cpp \
	gui/qt/dialogs/epg/EPGView.moc.cpp \
	gui/qt/dialogs/epg/EPGWidget.moc.cpp \
	gui/qt/dialogs/epg/epg.moc.cpp \
	gui/qt/dialogs/errors/errors.moc.cpp \
	gui/qt/dialogs/extended/extended.moc.cpp \
	gui/qt/dialogs/extended/extended_panels.moc.cpp \
	gui/qt/dialogs/extensions/extensions.moc.cpp \
	gui/qt/dialogs/extensions/extensions_manager.moc.cpp \
	gui/qt/dialogs/fingerprint/chromaprint.moc.cpp \
	gui/qt/dialogs/fingerprint/fingerprintdialog.moc.cpp \
	gui/qt/dialogs/firstrun/firstrunwizard.moc.cpp \
	gui/qt/dialogs/gototime/gototime.moc.cpp \
	gui/qt/dialogs/help/aboutmodel.moc.cpp \
	gui/qt/dialogs/help/help.moc.cpp \
	gui/qt/dialogs/mediainfo/info_panels.moc.cpp \
	gui/qt/dialogs/mediainfo/info_widgets.moc.cpp \
	gui/qt/dialogs/mediainfo/mediainfo.moc.cpp \
	gui/qt/dialogs/messages/messages.moc.cpp \
	gui/qt/dialogs/open/open.moc.cpp \
	gui/qt/dialogs/open/open_panels.moc.cpp \
	gui/qt/dialogs/open/openurl.moc.cpp \
	gui/qt/dialogs/plugins/addons_manager.moc.cpp \
	gui/qt/dialogs/plugins/plugins.moc.cpp \
	gui/qt/dialogs/podcast/podcast_configuration.moc.cpp \
	gui/qt/dialogs/preferences/complete_preferences.moc.cpp \
	gui/qt/dialogs/preferences/preferences.moc.cpp \
	gui/qt/dialogs/preferences/preferences_widgets.moc.cpp \
	gui/qt/dialogs/preferences/simple_preferences.moc.cpp \
	gui/qt/dialogs/sout/convert.moc.cpp \
	gui/qt/dialogs/sout/profile_selector.moc.cpp \
	gui/qt/dialogs/sout/sout.moc.cpp \
	gui/qt/dialogs/sout/sout_widgets.moc.cpp \
	gui/qt/dialogs/toolbar/controlbar_profile.moc.cpp \
	gui/qt/dialogs/toolbar/controlbar_profile_model.moc.cpp \
	gui/qt/dialogs/playlists/playlists.moc.cpp \
	gui/qt/maininterface/compositor.moc.cpp \
	gui/qt/maininterface/compositor_dummy.moc.cpp \
	gui/qt/maininterface/interface_window_handler.moc.cpp \
	gui/qt/maininterface/mainctx.moc.cpp \
	gui/qt/maininterface/mainui.moc.cpp \
	gui/qt/maininterface/videosurface.moc.cpp \
	gui/qt/maininterface/video_window_handler.moc.cpp \
	gui/qt/medialibrary/medialib.moc.cpp \
	gui/qt/medialibrary/mlalbum.moc.cpp \
	gui/qt/medialibrary/mlalbummodel.moc.cpp \
	gui/qt/medialibrary/mlalbumtrack.moc.cpp \
	gui/qt/medialibrary/mlalbumtrackmodel.moc.cpp \
	gui/qt/medialibrary/mlartist.moc.cpp \
	gui/qt/medialibrary/mlartistmodel.moc.cpp \
	gui/qt/medialibrary/mlbasemodel.moc.cpp \
	gui/qt/medialibrary/mlfoldersmodel.moc.cpp \
	gui/qt/medialibrary/mlgenremodel.moc.cpp \
	gui/qt/medialibrary/mlgrouplistmodel.moc.cpp \
	gui/qt/medialibrary/mllistcache.moc.cpp \
	gui/qt/medialibrary/mlthreadpool.moc.cpp \
	gui/qt/medialibrary/mlqmltypes.moc.cpp \
	gui/qt/medialibrary/mlrecentsmodel.moc.cpp \
	gui/qt/medialibrary/mlrecentsvideomodel.moc.cpp \
	gui/qt/medialibrary/mlurlmodel.moc.cpp \
	gui/qt/medialibrary/mlvideo.moc.cpp \
	gui/qt/medialibrary/mlvideomodel.moc.cpp \
	gui/qt/medialibrary/mlplaylistlistmodel.moc.cpp \
	gui/qt/medialibrary/mlplaylistmodel.moc.cpp \
	gui/qt/menus/custom_menus.moc.cpp \
	gui/qt/menus/qml_menu_wrapper.moc.cpp \
	gui/qt/menus/menus.moc.cpp \
	gui/qt/network/networkdevicemodel.moc.cpp \
	gui/qt/network/networksourcesmodel.moc.cpp \
	gui/qt/network/networkmediamodel.moc.cpp \
	gui/qt/network/servicesdiscoverymodel.moc.cpp \
	gui/qt/player/input_models.moc.cpp \
	gui/qt/player/player_controller.moc.cpp \
	gui/qt/player/player_controlbar_model.moc.cpp \
	gui/qt/player/control_list_model.moc.cpp \
	gui/qt/playlist/playlist_common.moc.cpp \
	gui/qt/playlist/playlist_controller.moc.cpp \
	gui/qt/playlist/playlist_item.moc.cpp \
	gui/qt/playlist/playlist_model.moc.cpp \
	gui/qt/util/asynctask.moc.cpp \
	gui/qt/util/audio_device_model.moc.cpp \
	gui/qt/util/color_scheme_model.moc.cpp \
	gui/qt/util/imageluminanceextractor.moc.cpp \
	gui/qt/util/i18n.moc.cpp \
	gui/qt/util/keyhelper.moc.cpp \
	gui/qt/util/navigation_history.moc.cpp \
	gui/qt/util/item_key_event_filter.moc.cpp \
	gui/qt/util/mouse_event_filter.moc.cpp \
	gui/qt/util/flickable_scroll_handler.moc.cpp \
	gui/qt/util/qvlcapp.moc.cpp \
	gui/qt/util/renderer_manager.moc.cpp \
	gui/qt/util/selectable_list_model.moc.cpp \
	gui/qt/util/sortfilterproxymodel.moc.cpp \
	gui/qt/util/systempalette.moc.cpp \
	gui/qt/util/validators.moc.cpp \
	gui/qt/util/varchoicemodel.moc.cpp \
	gui/qt/util/variables.moc.cpp \
	gui/qt/util/vlctick.moc.cpp \
	gui/qt/util/qmlinputitem.moc.cpp \
	gui/qt/widgets/native/animators.moc.cpp \
	gui/qt/widgets/native/customwidgets.moc.cpp \
	gui/qt/widgets/native/interface_widgets.moc.cpp \
	gui/qt/widgets/native/navigation_attached.moc.cpp \
	gui/qt/widgets/native/mlfolderseditor.moc.cpp \
	gui/qt/widgets/native/roundimage.moc.cpp \
	gui/qt/widgets/native/searchlineedit.moc.cpp

if HAVE_WIN32
nodist_libqt_plugin_la_SOURCES += gui/qt/maininterface/mainctx_win32.moc.cpp \
	gui/qt/maininterface/compositor_win7.moc.cpp

if HAVE_DCOMP
nodist_libqt_plugin_la_SOURCES += \
	gui/qt/maininterface/compositor_dcomp_acrylicsurface.moc.cpp \
	gui/qt/maininterface/compositor_dcomp.moc.cpp \
	gui/qt/maininterface/compositor_dcomp_uisurface.moc.cpp
endif

endif

if HAVE_XCB
if HAVE_XCB_DAMAGE
nodist_libqt_plugin_la_SOURCES += \
	gui/qt/maininterface/compositor_x11.moc.cpp \
	gui/qt/maininterface/compositor_x11_renderclient.moc.cpp \
	gui/qt/maininterface/compositor_x11_renderwindow.moc.cpp \
	gui/qt/maininterface/compositor_x11_uisurface.moc.cpp \
	gui/qt/maininterface/compositor_x11_utils.moc.cpp
endif
endif

nodist_libqt_plugin_la_SOURCES += \
	gui/qt/dialogs/extended/ui_equalizer.h \
	gui/qt/dialogs/extended/ui_video_effects.h \
	gui/qt/dialogs/fingerprint/ui_fingerprintdialog.h \
	gui/qt/dialogs/firstrun/ui_firstrunwizard.h \
	gui/qt/dialogs/help/ui_about.h \
	gui/qt/dialogs/help/ui_update.h \
	gui/qt/dialogs/messages/ui_messages_panel.h \
	gui/qt/dialogs/open/ui_open.h \
	gui/qt/dialogs/open/ui_open_capture.h \
	gui/qt/dialogs/open/ui_open_disk.h \
	gui/qt/dialogs/open/ui_open_file.h \
	gui/qt/dialogs/open/ui_open_net.h \
	gui/qt/dialogs/podcast/ui_podcast_configuration.h \
	gui/qt/dialogs/preferences/ui_sprefs_audio.h \
	gui/qt/dialogs/preferences/ui_sprefs_input.h \
	gui/qt/dialogs/preferences/ui_sprefs_interface.h \
	gui/qt/dialogs/preferences/ui_sprefs_medialibrary.h \
	gui/qt/dialogs/preferences/ui_sprefs_subtitles.h \
	gui/qt/dialogs/preferences/ui_sprefs_video.h \
	gui/qt/dialogs/sout/ui_profiles.h \
	gui/qt/dialogs/sout/ui_sout.h \
	gui/qt/dialogs/vlm/ui_vlm.h

# User interface compilation

uic_verbose = $(uic_verbose_$(V))
uic_verbose_ = $(uic_verbose__$(AM_DEFAULT_VERBOSITY))
uic_verbose_0 = @echo "  UIC   " $@;
uic_verbose__0 = $(uic_verbose_0)

MOC_CPPFLAGS = $(DEFS) \
	-I$(top_srcdir)/include -I$(top_builddir)/include -I$(top_builddir) \
	$(libqt_plugin_la_CPPFLAGS)
if HAVE_DARWIN
MOC_CPPFLAGS += -DQ_OS_MAC
endif
if HAVE_WIN32
MOC_CPPFLAGS += -D_WIN32
endif

libqt_plugin_la_UI = \
	gui/qt/dialogs/extended/equalizer.ui \
	gui/qt/dialogs/extended/video_effects.ui \
	gui/qt/dialogs/fingerprint/fingerprintdialog.ui \
	gui/qt/dialogs/firstrun/firstrunwizard.ui \
	gui/qt/dialogs/help/about.ui \
	gui/qt/dialogs/help/update.ui \
	gui/qt/dialogs/messages/messages_panel.ui \
	gui/qt/dialogs/open/open.ui \
	gui/qt/dialogs/open/open_capture.ui \
	gui/qt/dialogs/open/open_disk.ui \
	gui/qt/dialogs/open/open_file.ui \
	gui/qt/dialogs/open/open_net.ui \
	gui/qt/dialogs/podcast/podcast_configuration.ui \
	gui/qt/dialogs/preferences/sprefs_audio.ui \
	gui/qt/dialogs/preferences/sprefs_input.ui \
	gui/qt/dialogs/preferences/sprefs_interface.ui \
	gui/qt/dialogs/preferences/sprefs_medialibrary.ui \
	gui/qt/dialogs/preferences/sprefs_subtitles.ui \
	gui/qt/dialogs/preferences/sprefs_video.ui \
	gui/qt/dialogs/sout/profiles.ui \
	gui/qt/dialogs/sout/sout.ui \
	gui/qt/dialogs/vlm/vlm.ui
EXTRA_DIST += $(libqt_plugin_la_UI)

ui_%.h: %.ui
	$(AM_V_at)$(MKDIR_P) "gui/qt/ui"
	$(AM_V_at)rm -f $@ $@.tmp
	$(AM_V_at)echo "#define Q_(a,b) QString::fromUtf8(_(a))" > $@.tmp
	$(uic_verbose)$(UIC) -tr "Q_" $< >> $@.tmp
	$(AM_V_at)sed -e 's/Q_(\"_(\\\"\(.*\)\\\")"/Q_("\1"/' $@.tmp >$@
	$(AM_V_at)rm -f $@.tmp

# Resources

libqt_plugin_la_RES = \
	gui/qt/pixmaps/VLCIcons.ttf \
	gui/qt/pixmaps/clear.svg \
	gui/qt/pixmaps/eject.svg \
	gui/qt/pixmaps/faster.svg \
	gui/qt/pixmaps/faster2.svg \
	gui/qt/pixmaps/go-next.svg \
	gui/qt/pixmaps/addons/addon.svg \
	gui/qt/pixmaps/addons/addon_broken.svg \
	gui/qt/pixmaps/addons/addon_blue.svg \
	gui/qt/pixmaps/addons/addon_cyan.svg \
	gui/qt/pixmaps/addons/addon_green.svg \
	gui/qt/pixmaps/addons/addon_magenta.svg \
	gui/qt/pixmaps/addons/addon_red.svg \
	gui/qt/pixmaps/addons/addon_yellow.svg \
	gui/qt/pixmaps/addons/score.svg \
	gui/qt/pixmaps/menu.svg \
	gui/qt/pixmaps/menus/exit_16px.svg \
	gui/qt/pixmaps/menus/help_16px.svg \
	gui/qt/pixmaps/menus/info_16px.svg \
	gui/qt/pixmaps/menus/messages_16px.svg \
	gui/qt/pixmaps/menus/playlist_16px.svg \
	gui/qt/pixmaps/menus/preferences_16px.svg \
	gui/qt/pixmaps/menus/settings_16px.svg \
	gui/qt/pixmaps/menus/stream_16px.svg \
	gui/qt/pixmaps/next.svg \
	gui/qt/pixmaps/noart-64.png \
	gui/qt/pixmaps/noart.png \
	gui/qt/pixmaps/noart_album.svg \
	gui/qt/pixmaps/noart_albumCover.svg \
	gui/qt/pixmaps/noart_artist.svg \
	gui/qt/pixmaps/noart_artist_small.svg \
	gui/qt/pixmaps/noart_artistCover.svg \
	gui/qt/pixmaps/noart_videoCover.svg \
	gui/qt/pixmaps/pause.svg \
	gui/qt/pixmaps/play.svg \
	gui/qt/pixmaps/play_button.svg \
	gui/qt/pixmaps/play_shadow.png \
	gui/qt/pixmaps/new_indicator.svg \
	gui/qt/pixmaps/playlist/add.svg \
	gui/qt/pixmaps/playlist/playlist.svg \
	gui/qt/pixmaps/playlist/remove.svg \
	gui/qt/pixmaps/playlist/repeat_all.svg \
	gui/qt/pixmaps/playlist/repeat_off.svg \
	gui/qt/pixmaps/playlist/repeat_one.svg \
	gui/qt/pixmaps/playlist/active_indicator.svg \
	gui/qt/pixmaps/playlist/shuffle_on.svg \
	gui/qt/pixmaps/playlist/dropzone.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/capture.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/pictures.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/disc.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/playlist.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/lan.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/podcast.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/library.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/screen.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/movie.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/mtp.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/music.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/network.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/sd/appletrailers.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/sd/icecast.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/sd/katsomo.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/sd/fmc.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/sd/frenchtv.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/sd/jamendo.svg \
	gui/qt/pixmaps/playlist/sidebar-icons/sd/assembleenationale.svg \
	gui/qt/pixmaps/prefs/advprefs_audio.svg \
	gui/qt/pixmaps/prefs/advprefs_codec.svg \
	gui/qt/pixmaps/prefs/advprefs_extended.svg \
	gui/qt/pixmaps/prefs/advprefs_intf.svg \
	gui/qt/pixmaps/prefs/advprefs_playlist.svg \
	gui/qt/pixmaps/prefs/advprefs_sout.svg \
	gui/qt/pixmaps/prefs/advprefs_video.svg \
	gui/qt/pixmaps/prefs/spref_cone_Audio_64.png \
	gui/qt/pixmaps/prefs/spref_cone_Hotkeys_64.png \
	gui/qt/pixmaps/prefs/spref_cone_Input_64.png \
	gui/qt/pixmaps/prefs/spref_cone_Interface_64.png \
	gui/qt/pixmaps/prefs/spref_cone_Medialibrary_64.png \
	gui/qt/pixmaps/prefs/spref_cone_Subtitles_64.png \
	gui/qt/pixmaps/prefs/spref_cone_Video_64.png \
	gui/qt/pixmaps/previous.svg \
	gui/qt/pixmaps/profile_new.svg \
	gui/qt/pixmaps/sample_complete.png \
	gui/qt/pixmaps/sample_minimal.png \
	gui/qt/pixmaps/sample_skins.png \
	gui/qt/pixmaps/slower.svg \
	gui/qt/pixmaps/slower2.svg \
	gui/qt/pixmaps/space.svg \
	gui/qt/pixmaps/stop.svg \
	gui/qt/pixmaps/toolbar/audiosub.svg \
	gui/qt/pixmaps/toolbar/arrows.svg \
	gui/qt/pixmaps/toolbar/aspect-ratio.svg \
	gui/qt/pixmaps/toolbar/atob.svg \
	gui/qt/pixmaps/toolbar/atob_noa.svg \
	gui/qt/pixmaps/toolbar/atob_nob.svg \
	gui/qt/pixmaps/toolbar/atob_bg_a.svg \
	gui/qt/pixmaps/toolbar/atob_bg_ab.svg \
	gui/qt/pixmaps/toolbar/atob_bg_b.svg \
	gui/qt/pixmaps/toolbar/atob_bg_none.svg \
	gui/qt/pixmaps/toolbar/atob_fg_a.svg \
	gui/qt/pixmaps/toolbar/atob_fg_ab.svg \
	gui/qt/pixmaps/toolbar/atob_fg_b.svg \
	gui/qt/pixmaps/toolbar/renderer.svg \
	gui/qt/pixmaps/toolbar/defullscreen.svg \
	gui/qt/pixmaps/toolbar/dvd_menu.svg \
	gui/qt/pixmaps/toolbar/dvd_next.svg \
	gui/qt/pixmaps/toolbar/dvd_prev.svg \
	gui/qt/pixmaps/toolbar/extended_16px.svg \
	gui/qt/pixmaps/toolbar/frame-by-frame.svg \
	gui/qt/pixmaps/toolbar/fullscreen.svg \
	gui/qt/pixmaps/toolbar/play_reverse.svg \
	gui/qt/pixmaps/toolbar/record_16px.svg \
	gui/qt/pixmaps/toolbar/snapshot.svg \
	gui/qt/pixmaps/toolbar/skip_for.svg \
	gui/qt/pixmaps/toolbar/skip_back.svg \
	gui/qt/pixmaps/toolbar/tv.svg \
	gui/qt/pixmaps/toolbar/tvtelx.svg \
	gui/qt/pixmaps/toolbar/visu.svg \
	gui/qt/pixmaps/toolbar/volume-high.svg \
	gui/qt/pixmaps/toolbar/volume-low.svg \
	gui/qt/pixmaps/toolbar/volume-medium.svg \
	gui/qt/pixmaps/toolbar/volume-muted.svg \
	gui/qt/pixmaps/toolbar/volume-slider-inside.svg \
	gui/qt/pixmaps/toolbar/volume-slider-outside.svg \
	gui/qt/pixmaps/types/capture-card_16px.svg \
	gui/qt/pixmaps/types/disc_16px.svg \
	gui/qt/pixmaps/types/file-asym_16px.svg \
	gui/qt/pixmaps/types/file-wide_16px.svg \
	gui/qt/pixmaps/types/file_black.svg \
	gui/qt/pixmaps/types/folder-blue_16px.svg \
	gui/qt/pixmaps/types/folder-grey_16px.svg \
	gui/qt/pixmaps/types/harddisk_16px.svg \
	gui/qt/pixmaps/types/network_16px.svg \
	gui/qt/pixmaps/types/tape_16px.svg \
	gui/qt/pixmaps/types/type_directory.svg \
	gui/qt/pixmaps/types/type_directory_black.svg \
	gui/qt/pixmaps/types/type_file.svg \
	gui/qt/pixmaps/types/type_stream.svg \
	gui/qt/pixmaps/types/type_node.svg \
	gui/qt/pixmaps/types/type_playlist.svg \
	gui/qt/pixmaps/types/type_unknown.xpm \
	gui/qt/pixmaps/util/wait1.svg \
	gui/qt/pixmaps/util/wait2.svg \
	gui/qt/pixmaps/util/wait3.svg \
	gui/qt/pixmaps/util/wait4.svg \
	gui/qt/pixmaps/win7/win7thumbnail_pause.svg \
	gui/qt/pixmaps/win7/win7thumbnail_prev.svg \
	gui/qt/pixmaps/win7/win7thumbnail_next.svg \
	gui/qt/pixmaps/win7/win7thumbnail_play.svg \
	gui/qt/pixmaps/update.svg \
	gui/qt/pixmaps/valid.svg \
	gui/qt/pixmaps/search_clear.svg \
	gui/qt/pixmaps/lock.svg \
	gui/qt/pixmaps/close.svg \
	gui/qt/pixmaps/rename.svg \
	gui/qt/pixmaps/del.svg \
	gui/qt/pixmaps/ellipsis.svg \
	gui/qt/pixmaps/topbar/grid.svg \
	gui/qt/pixmaps/topbar/list.svg \
	gui/qt/pixmaps/cone.svg \
	gui/qt/pixmaps/album_cover.svg \
	gui/qt/pixmaps/back.svg \
	gui/qt/pixmaps/time.svg \
	gui/qt/pixmaps/theme_dark.svg \
	gui/qt/pixmaps/theme_daynight.svg \
	gui/qt/pixmaps/theme_light.svg

if HAVE_WIN32
libqt_plugin_la_RES += gui/qt/pixmaps/windows-theme.conf
endif

#QML and JS resources
libqt_plugin_la_QML = \
	gui/qt/dialogs/dialogs/qml/CustomDialog.qml \
	gui/qt/dialogs/dialogs/qml/Dialogs.qml \
	gui/qt/dialogs/dialogs/qml/ModalDialog.qml \
	gui/qt/dialogs/dialogs/qml/WindowDialog.qml \
	gui/qt/dialogs/help/qml/About.qml \
	gui/qt/dialogs/toolbar/qml/EditorDNDDelegate.qml \
	gui/qt/dialogs/toolbar/qml/EditorDNDView.qml\
	gui/qt/dialogs/toolbar/qml/EditorDummyButton.qml \
	gui/qt/dialogs/toolbar/qml/EditorTabButton.qml \
	gui/qt/dialogs/toolbar/qml/ToolbarEditor.qml \
	gui/qt/dialogs/toolbar/qml/ToolbarEditorDialog.qml \
	gui/qt/dialogs/toolbar/qml/ToolbarEditorButtonList.qml \
	gui/qt/maininterface/qml/BannerSources.qml \
	gui/qt/maininterface/qml/MainInterface.qml \
	gui/qt/maininterface/qml/MainDisplay.qml \
	gui/qt/maininterface/qml/MainGridView.qml \
	gui/qt/maininterface/qml/MainTableView.qml \
	gui/qt/maininterface/qml/NoMedialibHome.qml \
	gui/qt/medialibrary/qml/ArtistTopBanner.qml \
	gui/qt/medialibrary/qml/AudioGridItem.qml \
	gui/qt/medialibrary/qml/EmptyLabel.qml \
	gui/qt/medialibrary/qml/MediaGroupDisplay.qml \
	gui/qt/medialibrary/qml/MusicAlbums.qml \
	gui/qt/medialibrary/qml/MusicAlbumsDisplay.qml \
	gui/qt/medialibrary/qml/MusicAlbumsGridExpandDelegate.qml \
	gui/qt/medialibrary/qml/MusicArtist.qml \
	gui/qt/medialibrary/qml/MusicArtistDelegate.qml \
	gui/qt/medialibrary/qml/MusicArtistsAlbums.qml \
	gui/qt/medialibrary/qml/MusicAllArtists.qml \
	gui/qt/medialibrary/qml/MusicArtistsDisplay.qml \
	gui/qt/medialibrary/qml/MusicDisplay.qml \
	gui/qt/medialibrary/qml/MusicGenres.qml \
	gui/qt/medialibrary/qml/MusicGenresDisplay.qml \
	gui/qt/medialibrary/qml/MusicPlaylistsDisplay.qml \
	gui/qt/medialibrary/qml/MusicTrackListDisplay.qml \
	gui/qt/medialibrary/qml/MusicTracksDisplay.qml \
	gui/qt/medialibrary/qml/UrlListDisplay.qml \
	gui/qt/medialibrary/qml/VideoDisplay.qml \
	gui/qt/medialibrary/qml/VideoAll.qml \
	gui/qt/medialibrary/qml/VideoAllDisplay.qml \
	gui/qt/medialibrary/qml/VideoAllSubDisplay.qml \
	gui/qt/medialibrary/qml/PlaylistMediaList.qml \
	gui/qt/medialibrary/qml/PlaylistMedia.qml \
	gui/qt/medialibrary/qml/PlaylistMediaDelegate.qml \
	gui/qt/medialibrary/qml/PlaylistMediaDisplay.qml \
	gui/qt/medialibrary/qml/VideoPlaylistsDisplay.qml \
	gui/qt/medialibrary/qml/VideoDisplayRecentVideos.qml \
	gui/qt/medialibrary/qml/VideoGridItem.qml \
	gui/qt/medialibrary/qml/VideoInfoExpandPanel.qml \
	gui/qt/medialibrary/qml/VideoListDisplay.qml \
	gui/qt/menus/qml/GlobalShortcuts.qml \
	gui/qt/menus/qml/GlobalShortcutsMedialib.qml \
	gui/qt/menus/qml/Menubar.qml \
	gui/qt/network/qml/AddressbarButton.qml \
	gui/qt/network/qml/DiscoverDisplay.qml \
	gui/qt/network/qml/DiscoverUrlDisplay.qml \
	gui/qt/network/qml/NetworkAddressbar.qml \
	gui/qt/network/qml/NetworkBrowseDisplay.qml \
	gui/qt/network/qml/NetworkCustomCover.qml \
	gui/qt/network/qml/NetworkDisplay.qml \
	gui/qt/network/qml/NetworkGridItem.qml \
	gui/qt/network/qml/NetworkHomeDisplay.qml \
	gui/qt/network/qml/NetworkHomeDeviceListView.qml \
	gui/qt/network/qml/NetworkListItem.qml \
	gui/qt/network/qml/NetworkThumbnailItem.qml \
	gui/qt/network/qml/ServicesHomeDisplay.qml \
	gui/qt/player/qml/qmldir \
	gui/qt/player/qml/ControlBar.qml \
	gui/qt/player/qml/ControlbarControls.qml \
	gui/qt/player/qml/LanguageMenu.qml \
	gui/qt/player/qml/PlaybackSpeed.qml \
	gui/qt/player/qml/MiniPlayer.qml \
	gui/qt/player/qml/PIPPlayer.qml \
	gui/qt/player/qml/Player.qml \
	gui/qt/player/qml/PlayerControlLayout.qml \
	gui/qt/player/qml/PlayerMenu.qml \
	gui/qt/player/qml/PlayerMenuItem.qml \
	gui/qt/player/qml/ResumeDialog.qml \
	gui/qt/player/qml/SliderBar.qml \
	gui/qt/player/qml/TopBar.qml \
	gui/qt/player/qml/TrackInfo.qml \
	gui/qt/player/qml/ControlLayout.qml \
	gui/qt/player/qml/controlbarcontrols/HighResolutionTimeWidget.qml \
	gui/qt/player/qml/controlbarcontrols/ArtworkInfoWidget.qml \
	gui/qt/player/qml/controlbarcontrols/AspectRatioWidget.qml \
	gui/qt/player/qml/controlbarcontrols/AtoBButton.qml \
	gui/qt/player/qml/controlbarcontrols/BackButton.qml \
	gui/qt/player/qml/controlbarcontrols/ChapterNextButton.qml \
	gui/qt/player/qml/controlbarcontrols/ChapterPreviousButton.qml \
	gui/qt/player/qml/controlbarcontrols/ExpandingSpacerWidget.qml \
	gui/qt/player/qml/controlbarcontrols/ExtendedSettingsButton.qml \
	gui/qt/player/qml/controlbarcontrols/FasterButton.qml \
	gui/qt/player/qml/controlbarcontrols/FrameButton.qml \
	gui/qt/player/qml/controlbarcontrols/FullscreenButton.qml \
	gui/qt/player/qml/controlbarcontrols/InfoButton.qml \
	gui/qt/player/qml/controlbarcontrols/LangButton.qml \
	gui/qt/player/qml/controlbarcontrols/LoopButton.qml \
	gui/qt/player/qml/controlbarcontrols/MenuButton.qml \
	gui/qt/player/qml/controlbarcontrols/NextButton.qml \
	gui/qt/player/qml/controlbarcontrols/OpenButton.qml \
	gui/qt/player/qml/controlbarcontrols/PlaybackSpeedButton.qml \
	gui/qt/player/qml/controlbarcontrols/PlayButton.qml \
	gui/qt/player/qml/controlbarcontrols/PlayerSwitchButton.qml \
	gui/qt/player/qml/controlbarcontrols/PlaylistButton.qml \
	gui/qt/player/qml/controlbarcontrols/PreviousButton.qml \
	gui/qt/player/qml/controlbarcontrols/QuitButton.qml \
	gui/qt/player/qml/controlbarcontrols/RandomButton.qml \
	gui/qt/player/qml/controlbarcontrols/RecordButton.qml \
	gui/qt/player/qml/controlbarcontrols/SkipBackButton.qml \
	gui/qt/player/qml/controlbarcontrols/SkipForwardButton.qml \
	gui/qt/player/qml/controlbarcontrols/SlowerButton.qml \
	gui/qt/player/qml/controlbarcontrols/SnapshotButton.qml \
	gui/qt/player/qml/controlbarcontrols/SpacerWidget.qml \
	gui/qt/player/qml/controlbarcontrols/StopButton.qml \
	gui/qt/player/qml/controlbarcontrols/TeletextWidget.qml \
	gui/qt/player/qml/controlbarcontrols/VolumeWidget.qml \
	gui/qt/player/qml/controlbarcontrols/Fallback.qml \
	gui/qt/playlist/qml/PlaylistDelegate.qml \
	gui/qt/playlist/qml/PlaylistListView.qml \
	gui/qt/playlist/qml/PlaylistOverlayMenu.qml \
	gui/qt/playlist/qml/PlaylistToolbar.qml \
	gui/qt/playlist/qml/PlaylistDetachedWindow.qml \
	gui/qt/style/AcrylicController.qml \
	gui/qt/style/VLCColors.qml \
	gui/qt/style/VLCIcons.qml \
	gui/qt/style/VLCStyle.qml \
	gui/qt/style/qmldir \
	gui/qt/util/qml/Helpers.js \
	gui/qt/util/qml/SelectableDelegateModel.qml \
	gui/qt/util/qml/MultipleBinding.qml \
	gui/qt/util/qml/FlickableScrollHandler.qml \
	gui/qt/util/qml/ViewDragAutoScrollHandler.qml \
	gui/qt/widgets/qml/ActionButtonOverlay.qml \
	gui/qt/widgets/qml/ActionButtonPrimary.qml \
	gui/qt/widgets/qml/BannerTabButton.qml \
	gui/qt/widgets/qml/BusyIndicatorExt.qml \
	gui/qt/widgets/qml/CaptionLabel.qml \
	gui/qt/widgets/qml/CheckedDelegate.qml \
	gui/qt/widgets/qml/ComboBoxExt.qml \
	gui/qt/widgets/qml/AcrylicBackground.qml \
	gui/qt/widgets/qml/AnimatedBackground.qml \
	gui/qt/widgets/qml/CoverShadow.qml \
	gui/qt/widgets/qml/CSDWindowButton.qml \
	gui/qt/widgets/qml/CSDWindowButtonSet.qml \
	gui/qt/widgets/qml/CSDTitlebarTapNDrapHandler.qml \
	gui/qt/widgets/qml/CSDMouseStealer.qml \
	gui/qt/widgets/qml/CurrentIndicator.qml \
	gui/qt/widgets/qml/DragItem.qml \
	gui/qt/widgets/qml/DrawerExt.qml \
	gui/qt/widgets/qml/ExpandGridView.qml \
	gui/qt/widgets/qml/GridItem.qml \
	gui/qt/widgets/qml/GridShadows.qml \
	gui/qt/widgets/qml/HorizontalResizeHandle.qml \
	gui/qt/widgets/qml/IconLabel.qml \
	gui/qt/widgets/qml/IconButton.qml \
	gui/qt/widgets/qml/IconControlButton.qml \
	gui/qt/widgets/qml/IconToolButton.qml \
	gui/qt/widgets/qml/IconTrackButton.qml \
	gui/qt/widgets/qml/ImageToolButton.qml \
	gui/qt/widgets/qml/KeyNavigableGridView.qml \
	gui/qt/widgets/qml/KeyNavigableListView.qml \
	gui/qt/widgets/qml/KeyNavigableTableView.qml \
	gui/qt/widgets/qml/TableViewDelegate.qml \
	gui/qt/widgets/qml/LabelSeparator.qml \
	gui/qt/widgets/qml/ListCoverShadow.qml \
	gui/qt/widgets/qml/ListItem.qml \
	gui/qt/widgets/qml/ListLabel.qml \
	gui/qt/widgets/qml/LocalTabBar.qml \
	gui/qt/widgets/qml/MediaCover.qml \
	gui/qt/widgets/qml/SubtitleLabel.qml \
	gui/qt/widgets/qml/MenuCaption.qml \
	gui/qt/widgets/qml/MenuExt.qml \
	gui/qt/widgets/qml/MenuItemExt.qml \
	gui/qt/widgets/qml/MenuLabel.qml \
	gui/qt/widgets/qml/MLDragItem.qml \
	gui/qt/widgets/qml/NavigableCol.qml \
	gui/qt/widgets/qml/NavigableRow.qml \
	gui/qt/widgets/qml/PlayCover.qml \
	gui/qt/widgets/qml/RoundButton.qml \
	gui/qt/widgets/qml/ScanProgressBar.qml \
	gui/qt/widgets/qml/ScrollingText.qml \
	gui/qt/widgets/qml/SearchBox.qml \
	gui/qt/widgets/qml/ShadowCoverGenerator.qml \
	gui/qt/widgets/qml/SortControl.qml \
	gui/qt/widgets/qml/SpinBoxExt.qml \
	gui/qt/widgets/qml/StackViewExt.qml \
	gui/qt/widgets/qml/PageLoader.qml \
	gui/qt/widgets/qml/TabButtonExt.qml \
	gui/qt/widgets/qml/TableColumns.qml \
	gui/qt/widgets/qml/TransparentSpinBox.qml \
	gui/qt/widgets/qml/TextToolButton.qml \
	gui/qt/widgets/qml/ToolTipArea.qml \
	gui/qt/widgets/qml/VideoProgressBar.qml \
	gui/qt/widgets/qml/VideoQualityLabels.qml \
	gui/qt/widgets/qml/ListSubtitleLabel.qml \
	gui/qt/widgets/qml/PointingTooltip.qml \
	gui/qt/widgets/qml/FrostedGlassEffect.qml \
	gui/qt/widgets/qml/OverlayMenu.qml \
	gui/qt/widgets/qml/ToolTipExt.qml

lib_qt_plugin_la_QRC = gui/qt/vlc.qrc

if HAVE_WIN32
lib_qt_plugin_la_QRC += gui/qt/windows.qrc
endif

EXTRA_DIST += $(lib_qt_plugin_la_QRC) $(libqt_plugin_la_RES)

nodist_libqt_plugin_la_SOURCES += gui/qt/resources.cpp

if ENABLE_VLM
nodist_libqt_plugin_la_SOURCES += gui/qt/dialogs/vlm/vlm.moc.cpp
endif

if HAVE_QMLCACHE

nodist_libqt_plugin_la_SOURCES += gui/qt/qmlcache_loader.cpp
libqt_plugin_la_SOURCES += $(libqt_plugin_la_QML)

.qml.cpp:
	$(AM_V_GEN)$(QMLCACHE) --resource=$(srcdir)/gui/qt/vlc.qrc -o $@ $<

.js.cpp:
	$(AM_V_GEN)$(QMLCACHE) --resource=$(srcdir)/gui/qt/vlc.qrc -o $@ $<

.mjs.cpp:
	$(AM_V_GEN)$(QMLCACHE) --resource=$(srcdir)/gui/qt/vlc.qrc -o $@ $<

qml_cache.qrc: gui/qt/vlc.qrc
	$(AM_V_GEN)$(QMLCACHE) --filter-resource-file -o $@ $<

QRCS_EXCEPT_VLC_QRC = $(filter-out gui/qt/vlc.qrc, $(lib_qt_plugin_la_QRC))
QRCS_EXCEPT_VLC_QRC += qml_cache.qrc

gui/qt/resources.cpp: $(QRCS_EXCEPT_VLC_QRC) $(libqt_plugin_la_RES)
	$(AM_V_GEN)$(RCC) --name qml_cache -o $@ $(filter %.qrc, $^)

#output name matters here
gui/qt/qmlcache_loader.cpp: gui/qt/vlc.qrc qml_cache.qrc $(libqt_plugin_la_QML)
	$(AM_V_GEN)$(QMLCACHE) --resource-file-mapping=$<=qml_cache.qrc $< -o $@

else

EXTRA_DIST += $(libqt_plugin_la_QML)

gui/qt/resources.cpp: $(lib_qt_plugin_la_QRC) $(libqt_plugin_la_RES) $(libqt_plugin_la_QML)
	$(AM_V_GEN)$(RCC) --name vlc -o $@ $(filter %.qrc, $^)

endif

vlc_qt_check_SOURCES = gui/qt/vlc-qt-check.cpp
vlc_qt_check_CXXFLAGS = $(AM_CXXFLAGS) $(QT_CFLAGS) -fPIC $(CXXFLAGS_qt)
vlc_qt_check_LDADD = $(QT_LIBS)

if ENABLE_QT
gui_LTLIBRARIES += libqt_plugin.la
BUILT_SOURCES += $(nodist_libqt_plugin_la_SOURCES)
if !HAVE_WIN32
if !HAVE_OS2
pkglibexec_PROGRAMS += vlc-qt-check
endif
endif
endif
