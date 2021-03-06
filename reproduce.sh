#!/usr/bin/env sh

echo "--------Profiler with --configuration-cache + --dry-run"
echo "Problem: all builds use the same daemon"
gradle-profiler --benchmark --warmups 1 --iterations 2 --no-daemon \
   --gradle-user-home ./gradle-user-home-1 \
  --scenario-file configuration-scenarios.conf \
  configure-assemble-app-unchanged-with-cache

echo -e "\n\n\n--------Profiler with --no-configuration-cache + --dry-run"
echo "Has expected behavior, each build ran in a new daemon"
gradle-profiler --benchmark --warmups 1 --iterations 2 --no-daemon \
   --gradle-user-home ./gradle-user-home-2 \
  --scenario-file configuration-scenarios.conf \
  configure-assemble-app-unchanged-without-cache

# Running builds manually without profiler, with --configuration-cache + --dry-run
echo -e "\n\n\n--------Manual builds with --configuration-cache + --dry-run (does not occur)"
echo "Has expected behavior, each ran in a new daemon"
echo "Running build #1"
./gradlew :app:assemble --gradle-user-home ./gradle-user-home-3 --no-daemon --configuration-cache --dry-run
echo "Running build #2"
./gradlew :app:assemble --gradle-user-home ./gradle-user-home-3 --no-daemon --configuration-cache --dry-run
echo "2 single-use daemons were started:"
ls gradle-user-home-3/daemon/7.4.1/
