@ECHO OFF
rem For example we have: https://github.com/GStreamer/gst-docs/tree/master/examples/tutorials/android
rem and we want get (clone) only ".../android"
SET REPO_ORIGIN=https://github.com/GStreamer/gst-docs.git
SET BRANCH=examples/tutorials/android

git clone --filter=blob:none --no-checkout %REPO_ORIGIN%
cd gst-docs
git sparse-checkout init --cone
git sparse-checkout set %BRANCH%
git restore --staged %BRANCH%
rem git ls-files
git checkout
git restore --worktree %BRANCH%
pause