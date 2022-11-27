import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                color: Colors.tealAccent.shade100,
                borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(40.0)),
              ),
              child: const Image(
                image: AssetImage('assets/peep.png'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                    )),
                child: Column(
                  children: const [
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Login to continue your journey",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Did you forget me??';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      controller: _password,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Did you forget me??';
                        }
                        return null;
                      },
                    ),
                  ),
                  TextButton(child: const Text("Forgot Password?"), onPressed: () {  },),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        elevation: 15,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
                      ),
                      onPressed: () {
                        //login();
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Gimme a min')),
                          );
                        }
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: const Text("SIGN UP"),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New Joinee?",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300
                  ),
                ),
                TextButton(
                  onPressed: (){
                    //login();
                  },
                  child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      )
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
