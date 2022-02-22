import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var _controllerName = TextEditingController();
  var _controllerUsername = TextEditingController();
  var _controllerPassword = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool _remeberMe = false;
  List<String> _days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  List<String> _selectedDays = [];
  String _gender = 'Laki-laki';
  bool _darkMode = false;
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Page'), titleSpacing: 0),
      body: ListView(
        children: [
          const ListTile(title: Text('Textfield')),
          _textField(),
          const ListTile(title: Text('Text Formfield')),
          _textFormField(),
          const ListTile(title: Text('Input Radio')),
          _inputRadio(),
          const ListTile(title: Text('Input CheckBox')),
          _inputCheckBox(),
          const ListTile(title: Text('Input Switch')),
          _inputSwitch(),
          const ListTile(title: Text('Slider')),
          _inputSlider(),
        ],
      ),
    );
  }

  Widget _textField() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controllerName,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Input Name',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 2)),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Input Password',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              prefixIcon: Icon(Icons.vpn_key),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12),
                child:
                    IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
              ),
              enabled: true,
            ),
          ),
          SizedBox(height: 16),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'E-mail',
              hintText: 'Input E-mail',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              enabled: true,
              filled: true,
              fillColor: Colors.amber[100],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                print(_controllerName.text);
              },
              child: Text('Submit Textfield'))
        ],
      ),
    );
  }

  Widget _textFormField() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
                controller: _controllerUsername,
                validator: (value) => value == '' ? "Don't Empty" : null,
                decoration: const InputDecoration(labelText: 'Username')),
            TextFormField(
                controller: _controllerPassword,
                validator: (value) => value == '' ? "Don't Empty" : null,
                decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(_controllerUsername.text);
                    print(_controllerPassword.text);
                  }
                },
                child: const Text('Submit Text Formfield'))
          ],
        ),
      ),
    );
  }

  Widget _inputRadio() {
    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() => _gender = 'Laki-laki');
          },
          leading: Radio(
            value: 'Laki-laki',
            groupValue: _gender,
            onChanged: (value) {
              setState(() => _gender = value.toString());
            },
          ),
          title: const Text('Laki-laki'),
        ),
        ListTile(
          onTap: () {
            setState(() => _gender = 'Perempuan');
          },
          leading: Radio<String>(
            value: 'Perempuan',
            groupValue: _gender,
            onChanged: (value) {
              setState(() => _gender = value!);
            },
          ),
          title: const Text('Perempuan'),
        ),
      ],
    );
  }

  Widget _inputCheckBox() {
    return Column(
      children: [
        ListTile(
          onTap: () => setState(() => _remeberMe = !_remeberMe),
          leading: Checkbox(
            value: _remeberMe,
            onChanged: (value) => setState(() => _remeberMe = value!),
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: List.generate(_days.length, (index) {
            String day = _days[index];
            return CheckboxListTile(
              title: Text(day),
              value: _selectedDays.contains(day),
              onChanged: (value) {
                if (value!) {
                  _selectedDays.add(day);
                } else {
                  _selectedDays.remove(day);
                }
                setState(() {});
                print(_selectedDays);
              },
            );
          }),
        )
      ],
    );
  }

  Widget _inputSwitch() {
    return ListTile(
      onTap: () => setState(() => _darkMode = !_darkMode),
      title: const Text('Dark Mode'),
      trailing: Switch(
        value: _darkMode,
        onChanged: (value) => setState(() => _darkMode = value),
      ),
    );
  }

  Widget _inputSlider() {
    return Slider(
      min: 0,
      max: 10,
      divisions: 20,
      value: _sliderValue,
      label: '$_sliderValue',
      onChanged: (value) {
        setState(() => _sliderValue = value);

        print(value);
      },
    );
  }
}
