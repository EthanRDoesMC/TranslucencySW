include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = TranslucencyPrefs
TranslucencyPrefs_FILES = TLSRootListController.m
TranslucencyPrefs_INSTALL_PATH = /Library/PreferenceBundles
TranslucencyPrefs_FRAMEWORKS = UIKit
TranslucencyPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/translucency.plist$(ECHO_END)
