import 'package:flutter/material.dart';

class LoginSignUpPage extends StatefulWidget {
  LoginSignUpPage({this.params});

  final Map params;

  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();
}

enum FormMode { LOGIN, SIGNUP, FORGOTPASSWORD }

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  // Initial form is login form
  FormMode _formMode = FormMode.LOGIN;
  bool _isIos;
  bool _isLoading;

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  void _changeFormToPasswordReset() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.FORGOTPASSWORD;
    });
  }
  @override
  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.params['appName']),
        ),
        body: Stack(
          children: <Widget>[
            _showBody(),
            _showCircularProgress(),
          ],
        ));
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _showBody() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showLogo(),
              _showEmailInput(),
              _showPasswordInput(),
              _showPrimaryButton(),
              _showSecondaryButton(),
              _showForgotPasswordButton(),
              _showErrorMessage(),
            ],
          ),
        ));
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          //child: Image.asset('assets/flutter-icon.png'),
        ),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget _showPasswordInput() {
    if (_formMode != FormMode.FORGOTPASSWORD) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: new TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: 'Password',
              icon: new Icon(
                Icons.lock,
                color: Colors.grey,
              )),
          validator: (value) =>
          value.isEmpty ? 'Password can\'t be empty' : null,
          onSaved: (value) => _password = value.trim(),
        ),
      );
    } else {
      return new Text('An email will be sent allowing you to reset your password',
          style:
          new TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300));
    }
  }
  Widget _showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: widget.params['buttonColor'],
            child: _textPrimaryButton(),
            onPressed: () {},
          ),
        ));
  }

  Widget _showSecondaryButton() {
    return new FlatButton(
      child: _textSecondaryButton(),
      onPressed: _formMode == FormMode.LOGIN
          ? _changeFormToSignUp
          : _changeFormToLogin,
    );
  }

  Widget _showForgotPasswordButton() {
    return new FlatButton(
      child: _formMode == FormMode.LOGIN
          ? new Text('Forgot password?',
          style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300))
          : new Text('',
          style:
          new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300)),
      onPressed: _changeFormToPasswordReset,
    );
  }

  Widget _textPrimaryButton() {
    switch (_formMode) {
      case FormMode.LOGIN:
        return new Text('Login',
            style: new TextStyle(fontSize: 20.0, color: Colors.white));
        break;
      case FormMode.SIGNUP:
        return new Text('Create account',
            style: new TextStyle(fontSize: 20.0, color: Colors.white));
        break;
      case FormMode.FORGOTPASSWORD:
        return new Text('Reset password',
            style: new TextStyle(fontSize: 20.0, color: Colors.white));
        break;
    }
    return new Spacer();
  }

  Widget _textSecondaryButton() {
    switch (_formMode) {
      case FormMode.LOGIN:
        return new Text('Create an account',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
        break;
      case FormMode.SIGNUP:
        return new Text('Have an account? Sign in',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
        break;
      case FormMode.FORGOTPASSWORD:
        return new Text('Enter your email address or ... Cancel',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300));
        break;
    }
    return new Spacer();
  }
}

