import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/widgets/shared/custom_label_widget.dart';
import 'package:flutter/material.dart';

class UserTermsScreen extends StatelessWidget {
  static const name = 'user-terms-screen';
  const UserTermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(
          color: AppColors.tertiaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Lorem Ipsum',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi et venenatis est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut ac urna vel lacus ornare rhoncus id in nunc. Vestibulum sit amet bibendum lacus. Aenean ac imperdiet ante. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas at magna eleifend, vehicula nisi at, semper purus. Nunc odio lacus, sagittis nec est vitae, tempus sollicitudin purus. Mauris non justo pellentesque urna varius venenatis. Nunc risus ligula, scelerisque ac ligula quis, scelerisque posuere dui. Duis vel arcu tincidunt, mattis turpis nec, fringilla augue.',
                  maxLines: 20,
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Lorem Ipsum',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Aliquam ac nisl sed urna condimentum rhoncus sit amet at ligula. Vivamus sit amet mauris ac justo cursus tempor eget id risus. Curabitur nec arcu molestie, tristique nunc id, pharetra sem. Integer posuere bibendum mauris. Ut congue erat augue, a euismod est bibendum venenatis. Ut volutpat rutrum erat, ac facilisis nisl elementum et. In ultricies felis sed ligula egestas, a tempor nisi faucibus. Aenean fermentum feugiat viverra. Integer cursus, massa sit amet commodo consectetur, leo mi pellentesque augue, eget vehicula dui urna nec nulla. Curabitur dapibus malesuada tortor. Nulla sit amet risus maximus, semper nulla a, blandit ligula. Donec ornare lacus in hendrerit maximus. Fusce id imperdiet augue. Quisque malesuada lorem sit amet dolor iaculis, vel aliquam lectus suscipit.',
                  maxLines: 20,
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Lorem Ipsum',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Sed lobortis metus sit amet augue pulvinar, a mollis dolor porta. Ut massa lectus, volutpat ac sollicitudin quis, malesuada in enim. Ut suscipit erat at orci posuere, aliquet venenatis arcu ornare. Nunc ultricies quam non pharetra pretium. Vestibulum finibus laoreet lectus, non scelerisque lectus cursus vitae. Ut a pharetra diam. Maecenas pharetra diam et nunc dignissim, a gravida felis elementum. Aenean ex dui, rutrum quis fringilla at, dapibus elementum massa. Mauris sit amet neque risus. Nulla pellentesque vestibulum elit eu maximus. Vestibulum et mollis odio.',
                  maxLines: 20,
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Lorem Ipsum',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Quisque nec massa venenatis neque bibendum vestibulum ac vitae sem. Vestibulum magna est, gravida rutrum ante a, interdum auctor massa. Suspendisse a diam velit. Aenean ac sem sapien. Etiam volutpat, arcu nec eleifend lobortis, ipsum tellus venenatis metus, ac porta sem dui porttitor lorem. Pellentesque magna libero, varius eu dictum id, hendrerit eget lorem. Praesent blandit fringilla nulla. Nulla auctor egestas efficitur. Quisque rhoncus est eu mauris blandit, id ultricies nulla tempus.',
                  maxLines: 20,
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Lorem Ipsum',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.centerLeft,
                child: const CustomLabelWidget(
                  text: 'Cras ac dapibus augue. Mauris aliquam sit amet nibh interdum euismod. Donec facilisis purus non mi ultricies, a convallis velit vestibulum. Etiam sed est id massa laoreet porttitor. Curabitur rutrum, felis ac porttitor ornare, lacus leo consectetur neque, nec rhoncus odio turpis id nulla. Integer consectetur arcu a velit molestie ornare. Cras egestas et mauris ac dapibus. Nullam dapibus justo vel ultricies malesuada.',
                  maxLines: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}