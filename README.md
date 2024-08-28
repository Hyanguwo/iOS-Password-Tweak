# iOS Password Tweak

一个简单的 iOS Tweak，在设备激活时弹出密码输入框，要求用户输入正确的密码才能进入系统。如果输入错误，会提示“密码错误”，但不会退出程序。这个项目旨在为新手和有经验的开发者提供一个学习和分享的机会。

## 功能

- 弹出原生密码输入窗口。
- 验证用户输入的密码。
- 输入正确的密码后进入系统。
- 输入错误的密码会提示“密码错误”，提供重试机会，而不会退出程序。

## 安装指南

### 先决条件

- iOS 越狱设备。
- [Theos](https://theos.dev/) 开发环境。
- SSH 或 Filza 文件管理器，用于将 `.deb` 文件传输到设备。

### 编译和安装步骤

1. **克隆仓库**

   ```bash
   git clone https://github.com/YuAYUyyy/iOS-Password-Tweak.git
   cd iOS-Password-Tweak
