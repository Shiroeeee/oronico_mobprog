# oronico_mobprog

A new Flutter project.

Lab Activity 1A
In order to display and animate images, I produced a PostImageWidget which is able to recognise both image strings and booleans to show posts with and without images. However, my app continually resulted in 404s as it attempted to access local items such as URLs. Therefore I introduced a dynamic if statement so that if the string began with http then Image.network() would be used, but if it didn’t then it would ascertain that the item was local and employ Image.asset(). The same principle was used with the UserAvatarWidget; again using a ternary operator allowed me to resolve the issue of users having dull grey grid profile pictures. Then, having entered local image strings into newsfeed_screen.dart for example, assets/images/kirito.png, I declared the folder within pubspec.yaml meaning that Flutter could package up these items. Thus the whole card became dynamic and was able to successfully display both local and online images.
