import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hpulse/Redux/actions/ask_action.dart';
import 'package:hpulse/Redux/state/user_data_state.dart';
import 'package:hpulse/Redux/store.dart';
import 'package:hpulse/Redux/actions/user_info_add_action.dart';
import 'package:hpulse/config/theme/sizes_helper.dart';
import 'package:hpulse/config/theme/style.dart';

class AlertBoxCustom extends StatefulWidget {
  const AlertBoxCustom({Key key}) : super(key: key);

  @override
  _AlertBoxCustomState createState() => _AlertBoxCustomState();
}

class _AlertBoxCustomState extends State<AlertBoxCustom> {
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _validateName = false;
  bool _validatePassword = false;


  @override
  Widget build(BuildContext context) {
    Redux.store.dispatch(UserInfoAddAction(
      UserDataState(
        loginError: false,
      )
    ));
    return AlertDialog(
      title: Text("Login"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              validator: (value){
                if(value.isEmpty && _validateName ) {
                  return 'Please Enter the name';
                }
                  return null;

              },
              controller: name,
              autovalidateMode: AutovalidateMode.always,
              cursorColor: Style.primary,
              style: TextStyle(
                color: Style.primary,
              ),
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Style.primary,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Style.primary,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Style.primary
                  ) ,
                ),
                labelText: 'User id',
                // errorText: _validateName ?
                // 'User name cannot be empty':null
              ),

            ),
            SizedBox(
              height: setHeight(context) * 0.03,
            ),
            TextFormField(
              controller: password,
              autovalidateMode: AutovalidateMode.always,
              validator: (value){
                if(value.isEmpty && _validatePassword){
                  return "Please Enter the Password";
                }

                return null;
              },
              cursorColor: Style.primary,
              style: TextStyle(
                color: Style.primary,
              ),
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Style.primary,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Style.primary,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Style.primary
                  ) ,
                ),
                labelText: 'Password',
              ),

              obscureText: true,
            ),
            SizedBox(
              height: setHeight(context) * 0.05,
            ),

            StoreConnector<AppState, bool>(
              converter: (store)=>store.state.userData.loginError,
              builder: (context,loginFailed){

                if(loginFailed){
                  return Text(
                      "Please Enter Valid Username and Password",
                    style: TextStyle(
                      fontSize: Style.text_sm,
                      color: Style.danger,
                    ),
                  );
                }

                return SizedBox.shrink();
              },
            ),

          ],
        ),
      ),
      actions: <Widget>[
        StoreConnector<AppState, VoidCallback>(
            converter: (store) => () => store
                .dispatch(fetchUserInfoAction(
                store,
                name.text,
                password.text
            )),
            builder: (_, callBack) {
              return TextButton(
                onPressed: (){
                  print(password.text.isEmpty);
                  if(name.text.isEmpty  ){

                      setState(() {
                        _validateName = true;
                      });
                    }
                  if(password.text.isEmpty){
                      setState(() {
                        _validatePassword = true;
                      });
                    }
                  else{
                    callBack();
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Style.primary,
                  padding: EdgeInsets.only(
                    left: setWidth(context) * 0.05,
                    right: setWidth(context) * 0.05
                  ),
                ),
                child: StoreConnector<AppState, bool >(
                  converter: (store) => store.state.userData.infoLoading,
                  builder: (context, loading){

                    if(loading){
                      return SizedBox(
                        child: CircularProgressIndicator(),
                        height: setHeight(context) * 0.04,
                        width: setWidth(context) * 0.07,
                      );
                    }else{
                      return  Text(
                        'Login',
                        style: TextStyle(
                          color: Style.white,
                        ),
                      );
                    }
                  },
                )
              );
            }),
      ],
    );
  }
}

