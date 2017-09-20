include $(THEOS)/makefiles/common.mk
DEBUG = 0
GO_EASY_ON_ME = 1
TARGET_IPHONEOS_DEPLOYMENT_VERSON = 7.0

TWEAK_NAME = TranslucencySW
TranslucencySW_FILES = Tweak.xm
ARCHS = armv7 arm64 armv7s
TranslucencySW_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
