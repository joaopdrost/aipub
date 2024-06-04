import 'package:app/shared/routes.dart';
import 'package:app/store/user_store.dart';
import 'package:app/widgets/back_button.dart';
import 'package:app/widgets/textos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserStore user = Provider.of<UserStore>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.of(context).canPop()
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const BackButtonCustom(
                  color: Colors.transparent,
                ))
            : null,
        title: const TextCustom(
          text: 'Perfil',
          sizeText: 32,
        ),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 10,top: 10),
              height: 130,
              width: 130,
              child: CircleAvatar(
                child: TextCustom(
                  text: user.username[0], 
                  sizeText: 58,)
              ),
            ),
          ),
          TextCustom(text: '${user.username} ${user.surname}'),
          SizedBox(height: 50,),




          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.listPayment),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.credit_card_sharp,size: 36,),
                  ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                TextCustom(text: 'Pagamentos'),
                TextCustom(text: 'Meus cartões',sizeText: 18,color: Colors.grey,)
              ],),  ],
              ),
              Icon(Icons.arrow_forward_ios_rounded)
            
            ],),
          )
        ],
      ),
    );
  }
}
