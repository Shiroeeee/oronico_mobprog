import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';
import '../constant.dart';
import 'custom_text.dart';

class NewsfeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int? numOfLikes;
  final bool? hasImage;
  final String? imageUrl;
  final String? avatarUrl;

  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes,
    this.hasImage,
    this.imageUrl,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenUtilSp = ScreenUtil().setSp(10);
    final screenUtilWidth = ScreenUtil().setWidth(10);
    final screenUtilFontUserNameSize = ScreenUtil().setSp(15);
    final screenUtilIconSize = ScreenUtil().setSp(15);

    return Card(
      margin: EdgeInsets.all(screenUtilSp),
      child: Padding(
        padding: EdgeInsets.all(screenUtilSp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserAvatarWidget(
                  avatarUrl: avatarUrl,
                  radius: ScreenUtil().setSp(16),
                ),
                SizedBox(width: screenUtilWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: screenUtilFontUserNameSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: screenUtilIconSize,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            PostImageWidget(
              hasImage: hasImage ?? false,
              imageUrl: imageUrl,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButtonWidget(
                  numOfLikes: numOfLikes ?? 0,
                  onPressed: () {},
                ),
                CommentButtonWidget(
                  onPressed: () {},
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.redo, color: fbDarkPrimary),
                  label: CustomText(
                    text: 'Share',
                    fontSize: ScreenUtil().setSp(12),
                    color: fbDarkPrimary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                UserAvatarWidget(
                  avatarUrl: avatarUrl,
                  radius: ScreenUtil().setSp(12),
                ),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Container(
                  padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(10),
                    0,
                    0,
                    0,
                  ),
                  alignment: Alignment.centerLeft,
                  height: ScreenUtil().setHeight(25),
                  width: ScreenUtil().setWidth(330),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(ScreenUtil().setSp(10)),
                    ),
                  ),
                  child: CustomText(
                    text: 'Write a comment...',
                    fontSize: ScreenUtil().setSp(11),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            CustomText(
              text: 'View all comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class PostImageWidget extends StatelessWidget {
  final bool hasImage;
  final String? imageUrl;

  const PostImageWidget({
    super.key,
    required this.hasImage,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (!hasImage || imageUrl == null || imageUrl!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(8), bottom: ScreenUtil().setHeight(8)),
      child: imageUrl!.startsWith('http')
          ? Image.network(
              imageUrl!,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          : Image.asset(
              imageUrl!,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
    );
  }
}

class UserAvatarWidget extends StatelessWidget {
  final String? avatarUrl;
  final double radius;

  const UserAvatarWidget({
    super.key,
    this.avatarUrl,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    if (avatarUrl == null || avatarUrl!.isEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: fbLightPrimary,
        child: Icon(Icons.person, color: Colors.white, size: radius),
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: fbLightPrimary,
      backgroundImage: avatarUrl!.startsWith('http')
          ? NetworkImage(avatarUrl!) as ImageProvider
          : AssetImage(avatarUrl!) as ImageProvider,
    );
  }
}
class LikeButtonWidget extends StatelessWidget {
  final int numOfLikes;
  final VoidCallback onPressed;

  const LikeButtonWidget({
    super.key,
    required this.numOfLikes,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.thumb_up, color: fbPrimary),
      label: CustomText(
        text: numOfLikes.toString(),
        fontSize: ScreenUtil().setSp(12),
        color: fbDarkPrimary,
      ),
    );
  }
}

class CommentButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const CommentButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.comment, color: fbDarkPrimary),
      label: CustomText(
        text: 'Comment',
        fontSize: ScreenUtil().setSp(12),
        color: fbDarkPrimary,
      ),
    );
  }
}