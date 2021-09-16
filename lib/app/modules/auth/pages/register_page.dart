import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/auth/auth_store.dart';
import 'package:hurry/app/modules/auth/register_store.dart';
import 'package:hurry/app/modules/auth/widgets/image_pick.dart';
import 'package:hurry/app/modules/auth/widgets/input/auth_input.dart';
import 'package:hurry/app/modules/src/buttons/primary_button.dart';
import 'package:hurry/app/modules/src/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:path/path.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthStore store = Modular.get();

  TextEditingController emailController = TextEditingController();

  TextEditingController first_nameController = TextEditingController();

  TextEditingController last_nameController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController birthController = TextEditingController();

  TextEditingController avatarController = TextEditingController();

  TextEditingController cpfController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController retype_passwordController = TextEditingController();

  var cpfFormatter = MaskTextInputFormatter(mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  var birthFormatter = MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  PageController pageController = PageController();
  String imagePath = "";
  final cloudinary = Cloudinary(
    "281941533576787",
    "cALe807tCHhktbxlOTvTfLBnFow",
    "dyzuhli2j",
  );
  String urlImage = '';
  final ImagePicker _picker = ImagePicker();
  Future<void> galaryPicker() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final response = await cloudinary.uploadFile(
      filePath: image?.path,
      resourceType: CloudinaryResourceType.image,
      folder: "/user/img/",
    );
    urlImage = '${response.url}';
  }

  Future<void> imgPicker() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    final response = await cloudinary.uploadFile(
      filePath: photo?.path,
      resourceType: CloudinaryResourceType.image,
      folder: "/user/img/",
    );
    urlImage = '${response.url}';
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text('Registrar'),
        ),
        body: PageView(
          controller: pageController,
          children: [
            Container(
              height: screenSize.height,
              color: AppColors.backGroundColor,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthInput(
                          hint: 'Email',
                          obscure: false,
                          controller: emailController,
                          inputFormater: [],
                        ),
                        AuthInput(hint: 'Senha', obscure: true, controller: passwordController, inputFormater: []),
                        AuthInput(hint: 'Senha2', obscure: true, controller: retype_passwordController, inputFormater: []),
                        SizedBox(
                          height: 20,
                        ),
                        PrimaryButton(
                          text: 'Salvar',
                          onPressed: () {
                            if (emailController.text.isNotEmpty && passwordController.text == retype_passwordController.text) {
                              pageController.jumpToPage(1);
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: screenSize.height,
              color: AppColors.backGroundColor,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthInput(hint: 'Nome', obscure: false, controller: first_nameController, inputFormater: []),
                        AuthInput(hint: 'Sobrenome', obscure: false, controller: last_nameController, inputFormater: []),
                        AuthInput(hint: 'Genero', obscure: false, controller: genderController, inputFormater: []),
                        AuthInput(hint: 'Nascimento', obscure: false, controller: birthController, inputFormater: [birthFormatter]),
                        AuthInput(hint: 'cpf', obscure: false, controller: cpfController, inputFormater: [cpfFormatter]),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: ImageButton(
                                  text: 'Galery',
                                  onPressed: () {
                                    galaryPicker();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: ImageButton(
                                  text: 'Camera',
                                  onPressed: () {
                                    imgPicker();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        PrimaryButton(
                            text: 'Salvar',
                            onPressed: () {
                              store.register(emailController.text, first_nameController.text, last_nameController.text, genderController.text, birthController.text, cpfController.text, urlImage, passwordController.text);
                            }),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
