# flutterstudy

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

1.Debug的时候提示要SDK证书
首先打开命令行，进入到报错的sdk路径，找到可以处理licences的文件，我就贴出我的了
cd D:\Android\SDK\tools\bin
这时该路径下有一个windows批处理文件sdkmanager，用这个来解决问题，调用命令
sdkmanager --licenses
然后等一小会就巴拉巴拉一大堆licenses等待你同意，全部选yes就可以，反正也看不懂 之后，再到AS里build一下就好了。

Flutter 卡在 package get 的解决办法
https://flutter.dev/community/china
新增两个环境变量即可
我用的是win7，在环境变量 -> 用户变量中添加了这2个变量
PUB_HOSTED_URL https://pub.flutter-io.cn
FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
再重新执行flutter doctor即可

deployment发布
flutter build apk --split-per-abi