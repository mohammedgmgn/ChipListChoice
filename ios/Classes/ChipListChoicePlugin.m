#import "ChipListChoicePlugin.h"
#import <chip_list_choice/chip_list_choice-Swift.h>

@implementation ChipListChoicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftChipListChoicePlugin registerWithRegistrar:registrar];
}
@end
