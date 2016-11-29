# Run this script. Take output and put into Spectacle section of _set_osx_preferences.sh file
# https://github.com/mathiasbynens/dotfiles/issues/507#issue-59460151
for key in MakeLarger MakeSmaller MoveToBottomDisplay MoveToBottomHalf MoveToCenter MoveToFullscreen MoveToLeftDisplay MoveToLeftHalf MoveToLowerLeft MoveToLowerRight MoveToNextDisplay MoveToNextThird MoveToPreviousDisplay MoveToPreviousThird MoveToRightDisplay MoveToRightHalf MoveToTopDisplay MoveToTopHalf MoveToUpperLeft MoveToUpperRight RedoLastMove UndoLastMove; do
  printf "defaults write com.divisiblebyzero.Spectacle ${key} -data ";
  defaults read com.divisiblebyzero.Spectacle ${key} | sed 's/[^0-9a-f]//g';
done
