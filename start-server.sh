#!/bin/bash
# You can either add or comment to remove a flag for convenience

memory=350M
JAVA_FLAGS=(
  -Xms${memory}
  -Xmx${memory}
  --add-modules=jdk.incubator.vector 
  -XX:+UseG1GC -XX:MaxGCPauseMillis=200 
  -XX:+UnlockExperimentalVMOptions 
  -XX:+UnlockDiagnosticVMOptions 
  -XX:+DisableExplicitGC 
  -XX:+AlwaysPreTouch 
  -XX:G1NewSizePercent=28 
  -XX:G1HeapRegionSize=16M 
  -XX:G1ReservePercent=20 
  -XX:G1MixedGCCountTarget=3 
  -XX:InitiatingHeapOccupancyPercent=10 
  -XX:G1MixedGCLiveThresholdPercent=90 
  -XX:SurvivorRatio=32 
  -XX:MaxTenuringThreshold=1 
  -XX:+PerfDisableSharedMem 
  -XX:G1SATBBufferEnqueueingThresholdPercent=30 
  -XX:G1ConcMarkStepDurationMillis=5 
  -XX:G1ConcRSHotCardLimit=16 
  -XX:G1ConcRefinementServiceIntervalMillis=150 
  -XX:G1RSetUpdatingPauseTimePercent=0 
  -XX:+UseNUMA 
  -XX:-DontCompileHugeMethods 
  -XX:MaxNodeLimit=240000 
  -XX:NodeLimitFudgeFactor=8000 
  -XX:ReservedCodeCacheSize=400M 
  -XX:NonNMethodCodeHeapSize=12M 
  -XX:ProfiledCodeHeapSize=194M 
  -XX:NonProfiledCodeHeapSize=194M 
  -XX:NmethodSweepActivity=1 
  -XX:+UseFastUnorderedTimeStamps 
  -XX:+UseCriticalJavaThreadPriority 
  -XX:AllocatePrefetchStyle=3 
  -XX:+AlwaysActAsServerClassMachine 
  -XX:+UseTransparentHugePages 
  -XX:LargePageSizeInBytes=2M 
  -XX:+UseLargePages 
  -XX:+EagerJVMCI 
  -Dgraal.TuneInlinerExploration=1 
  -Dgraal.LoopRotation=true 
  -Dgraal.OptWriteMotion=true 
  -Dgraal.CompilerConfiguration=enterprise



)

unset JAVA_FLAGS
cd server
j9-java8 -jar server.jar
