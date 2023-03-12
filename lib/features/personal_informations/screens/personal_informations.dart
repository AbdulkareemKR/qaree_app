import 'package:Qaree/features/personal_informations/widgets/horizontal_button_used_in_list.dart';
import 'package:Qaree/features/personal_informations/widgets/custom_curved_clip_path.dart';
import 'package:Qaree/features/personal_informations/widgets/container_box_for_horizontal_buttons.dart';
import 'package:Qaree/features/personal_informations/screens/change_full_name.dart';
import 'package:Qaree/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Qaree/providers/reader_provider.dart';

class PersonalInformations extends ConsumerStatefulWidget {
  const PersonalInformations({super.key});
  @override
  ConsumerState<PersonalInformations> createState() =>
      _PersonalInformationsState();
}

class _PersonalInformationsState extends ConsumerState<PersonalInformations> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(readerProvider);

    return user.when(
      data: (user) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ClipPath(
              clipper: CustomCurvedClipPath(),
              child: Container(
                width: double.infinity,
                height: 250,
                color: ColorsConst.lightPurple,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 38.0),
                    child: Text(
                      "Profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 52,
                        fontFamily: "JosefinSans",
                        color: ColorsConst.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SpacingConst.vSpacing180,
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: ColorsConst.white,
                    child: CircleAvatar(
                      backgroundColor: ColorsConst.lightGrey,
                      radius: 55,
                      backgroundImage: AssetImage(
                        "assets/images/default_user_avatar.png",
                      ),
                    ),
                  ),
                ),
                SpacingConst.vSpacing6,
                Text(
                  '${user.name}',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsConst.black,
                  ),
                ),
                Text(
                  '${user.email}',
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorsConst.grey,
                  ),
                ),
                SpacingConst.vSpacing60,
                ContainerBoxForHorizontalButtons(
                  children: [
                    HorizontalButtonUsedInList(
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChangeFullName(),
                          ),
                        ),
                      },
                      buttonIcon: Icons.label_outline_sharp,
                      buttonText: "Change the full name",
                    ),
                    HorizontalButtonUsedInList(
                      onTap: () => {},
                      buttonIcon: Icons.email_outlined,
                      buttonText: "Change the email",
                    ),
                    HorizontalButtonUsedInList(
                      onTap: () => {},
                      buttonIcon: Icons.password_outlined,
                      buttonText: "Change the password",
                    ),
                    HorizontalButtonUsedInList(
                      onTap: () => {},
                      buttonIcon: Icons.date_range_outlined,
                      buttonText: "Change the birth date",
                    ),
                  ],
                ),
                SpacingConst.vSpacing40,
                ContainerBoxForHorizontalButtons(
                  children: [
                    HorizontalButtonUsedInList(
                      onTap: () => {},
                      buttonIcon: Icons.notifications_outlined,
                      buttonText: "Notifications",
                    ),
                    HorizontalButtonUsedInList(
                      onTap: () => {},
                      buttonIcon: Icons.language,
                      buttonText: "Language",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => Text("An error Ocurred"),
      loading: () => LoadingContainer(),
    );
  }
}
