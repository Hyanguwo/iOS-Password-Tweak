%hook SpringBoard

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self showPasswordAlert];
    %orig;
}

- (void)showPasswordAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"输入密码"
                                                                             message:@"请输入密码以继续"
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    // 添加一个文本框用于输入密码
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];

    // 确定按钮的逻辑
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *password = alertController.textFields.firstObject.text;
        if ([password isEqualToString:@"123"]) {
            NSLog(@"密码正确！");
            // 密码正确，继续使用设备
        } else {
            NSLog(@"密码错误！");
            [self showErrorAlert];  // 显示错误提示
        }
    }];

    [alertController addAction:confirmAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

// 显示密码错误的弹窗
- (void)showErrorAlert {
    UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"错误"
                                                                        message:@"密码错误，请重试。"
                                                                 preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *retryAction = [UIAlertAction actionWithTitle:@"重试" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showPasswordAlert];  // 重新显示密码输入弹窗
    }];

    [errorAlert addAction:retryAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:errorAlert animated:YES completion:nil];
}

%end