//
//  MyClass.m
//  
//
//  Created by rednow on 2020/11/25.
//

#import "NWCommonOC.h"
 
#if TARGET_OS_MAC

#import <IOKit/IOKitLib.h>
// Returns a CFData object, containing the computer's GUID.
CFDataRef copy_mac_address(void)
{
    kern_return_t             kernResult;
    mach_port_t               master_port;
    CFMutableDictionaryRef    matchingDict;
    io_iterator_t             iterator;
    io_object_t               service;
    CFDataRef                 macAddress = nil;
 
    kernResult = IOMasterPort(MACH_PORT_NULL, &master_port);
    if (kernResult != KERN_SUCCESS) {
        printf("IOMasterPort returned %d\n", kernResult);
        return nil;
    }
 
    matchingDict = IOBSDNameMatching(master_port, 0, "en0");
    if (!matchingDict) {
        printf("IOBSDNameMatching returned empty dictionary\n");
        return nil;
    }
 
    kernResult = IOServiceGetMatchingServices(master_port, matchingDict, &iterator);
    if (kernResult != KERN_SUCCESS) {
        printf("IOServiceGetMatchingServices returned %d\n", kernResult);
        return nil;
    }
 
    while((service = IOIteratorNext(iterator)) != 0) {
        io_object_t parentService;
 
        kernResult = IORegistryEntryGetParentEntry(service, kIOServicePlane,
                &parentService);
        if (kernResult == KERN_SUCCESS) {
            if (macAddress) CFRelease(macAddress);
 
            macAddress = (CFDataRef) IORegistryEntryCreateCFProperty(parentService,
                    CFSTR("IOMACAddress"), kCFAllocatorDefault, 0);
            IOObjectRelease(parentService);
        } else {
            printf("IORegistryEntryGetParentEntry returned %d\n", kernResult);
        }
 
        IOObjectRelease(service);
    }
    IOObjectRelease(iterator);
 
    return macAddress;
}

#endif

@implementation NWCommonOC

#if TARGET_OS_MAC

+ (NSData *)getMacAddress {
    NSData *data = (__bridge NSData *)(copy_mac_address());
    return data;
}

#else

+ (NSData *)getMacAddress {
    UIDevice *device = [UIDevice currentDevice];
    NSUUID *idintifier = [device identifierForVendor];
    uuid_t uuid;
    [identifier getUUIDBytes:uuid];
    NSData *guidData = [NSData dataWithBytes:(const void *)uuid length:16];
    return guidData;
}

#endif

@end
