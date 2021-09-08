import 'package:flutter/material.dart';
import 'package:flutter_crud/src/api/http_service.dart';
import 'package:flutter_crud/src/model/profile.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormAddScreen extends StatefulWidget {
  Profile profile;

  FormAddScreen({this.profile});

  @override
  _FormAddScreenState createState() => _FormAddScreenState();
}

class _FormAddScreenState extends State<FormAddScreen> {
  bool _isLoading = false;
  HttpService _apiService = HttpService();
  bool _isFieldNameValid;
  bool _isFieldLastNameValid;
  bool _isFieldBirthDateValid;
  bool _isFieldSalararyValid;
  bool _isFieldDescriptionValid;
  bool _isFieldAgeValid;
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerBirthDate = TextEditingController();
  TextEditingController _controllerSalarary = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();

  @override
  void initState() {
    if (widget.profile != null) {
      _isFieldNameValid = true;
      _controllerName.text = widget.profile.name;
      _isFieldLastNameValid = true;
      _controllerLastName.text = widget.profile.lastname;
      _isFieldBirthDateValid = true;
      _controllerBirthDate.text = widget.profile.birthdate;
      _isFieldSalararyValid = true;
      _controllerSalarary.text = widget.profile.salarary;
      _isFieldDescriptionValid = true;
      _controllerDescription.text = widget.profile.description;
      _isFieldAgeValid = true;
      _controllerAge.text = widget.profile.age.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.profile == null ? "Form Add" : "Change Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldName(),
                _buildTextFieldLastName(),
                _buildTextFieldBirthDate(),
                _buildTextFieldSalarary(),
                _buildTextFieldDescription(),
                _buildTextFieldAge(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RaisedButton(
                    child: Text(
                      widget.profile == null
                          ? "Submit".toUpperCase()
                          : "Update Data".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (_isFieldNameValid == null ||
                          _isFieldLastNameValid == null ||
                          _isFieldBirthDateValid == null ||
                          _isFieldSalararyValid == null ||
                          _isFieldDescriptionValid == null ||
                          _isFieldAgeValid == null ||
                          !_isFieldNameValid ||
                          !_isFieldLastNameValid ||
                          !_isFieldBirthDateValid ||
                          !_isFieldSalararyValid ||
                          !_isFieldDescriptionValid ||
                          !_isFieldAgeValid) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Please fill all field"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                      String name = _controllerName.text.toString();
                      String lastname = _controllerLastName.text.toString();
                      String birthdate = _controllerBirthDate.text.toString();
                      String salarary = _controllerSalarary.text.toString();
                      String description =
                          _controllerDescription.text.toString();
                      int age = int.parse(_controllerAge.text.toString());
                      Profile profile = Profile(
                          name: name,
                          lastname: lastname,
                          birthdate: birthdate,
                          salarary: salarary,
                          description: description,
                          age: age);
                      if (widget.profile == null) {
                        _apiService.createHTTP(profile).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(
                                _scaffoldState.currentState.context, true);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Submit data failed"),
                            ));
                          }
                        });
                      } else {
                        profile.id = widget.profile.id;
                        _apiService.updateHTTP(profile).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(
                                _scaffoldState.currentState.context, true);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Update data failed"),
                            ));
                          }
                        });
                      }
                    },
                    color: Colors.orange[600],
                  ),
                )
              ],
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldName() {
    return TextField(
      controller: _controllerName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Name",
        errorText: _isFieldNameValid == null || _isFieldNameValid
            ? null
            : "Full name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNameValid) {
          setState(() => _isFieldNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldLastName() {
    return TextField(
      controller: _controllerLastName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "LastName",
        errorText: _isFieldLastNameValid == null || _isFieldLastNameValid
            ? null
            : "LastName is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldLastNameValid) {
          setState(() => _isFieldLastNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldBirthDate() {
    return TextField(
      controller: _controllerBirthDate,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "BirthDate",
        errorText: _isFieldBirthDateValid == null || _isFieldBirthDateValid
            ? null
            : "BirthDate is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldBirthDateValid) {
          setState(() => _isFieldBirthDateValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldSalarary() {
    return TextField(
      controller: _controllerSalarary,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Salarary",
        errorText: _isFieldSalararyValid == null || _isFieldSalararyValid
            ? null
            : "Salarary is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldSalararyValid) {
          setState(() => _isFieldSalararyValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldDescription() {
    return TextField(
      controller: _controllerDescription,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Description",
        errorText: _isFieldDescriptionValid == null || _isFieldDescriptionValid
            ? null
            : "Description is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldDescriptionValid) {
          setState(() => _isFieldDescriptionValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldAge() {
    return TextField(
      controller: _controllerAge,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Age",
        errorText: _isFieldAgeValid == null || _isFieldAgeValid
            ? null
            : "Age is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldAgeValid) {
          setState(() => _isFieldAgeValid = isFieldValid);
        }
      },
    );
  }
}
