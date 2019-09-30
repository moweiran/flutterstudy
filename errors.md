1.  FAILURE: Build failed with an exception.
1.1 Execution failed for task ':app:preDebugBuild'.
Android dependency 'androidx.arch.core:core-runtime' has different version for the compile (2.0.0) and runtime (2.0.1) classpath. You should manually set the same version via DependencyResolution
解决方法：gradle版本问题。gradle 升级 4.4 到4.7就可以了 

2.  A RenderFlex overflowed by 605 pixels on the bottom.
解决办法：使用Extended
