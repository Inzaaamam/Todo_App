import 'package:flutter/material.dart';
import 'package:myapp/color/colors.dart';


class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  bool _obscureText = true;

  // ignore: unused_element
  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        // ignore: sized_box_for_whitespace
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              // Background container
              Container(
                height: size.height,
              
                color: Colors.black, // Adjust background color as needed
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Image.asset(
                  'images/Avatar.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height * 0.75,
                  decoration: const BoxDecoration(
                    // ignore: unnecessary_const
                    gradient: const LinearGradient(
                      // Start and end points of the gradient relative to the container
                      // begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                      

                      // Colors used in the gradient
                      colors: [
                        Color.fromARGB(255, 37, 36, 36), // Blue color at the top left
                         CustomColors
                                          .sinColor1,
                        // Green color at the bottom right
                      ],
                      stops: [0.8, 1.0], // Stops correspond to each color
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0), // Top left corner
                      topRight: Radius.circular(20.0), // Top right corner)
                    ),

                    // height: 400,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Get Started Free!',
                              style: TextStyle(fontSize: 40, color: Colors.white),
                            ),
                            const Text(
                              'Free Forever. No Credit Card Needed! ',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Email Adresss', style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '@usergmail', hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(Icons
                                      .person_2_outlined, color: Colors.white), // Prefix icon for email
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType
                                    .emailAddress, // Set the keyboard type for email input
                              ),
                            ),
                           const  SizedBox(height: 15,),
                               const Row(
                              children: [
                                Text(
                                  'Your Name', style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          const   SizedBox(height: 10,),
                             Container(
                              height: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: '@yourname', hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(Icons
                                      .person_2_outlined, color: Colors.white), // Prefix icon for email
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType
                                    .emailAddress, // Set the keyboard type for email input
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Row(
                              children: [
                                Text('Password', style: TextStyle(color: Colors.white),),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 55,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                        // Start and end points of the gradient relative to the container
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        // Colors used in the gradient
                                        colors: [
                                          Color.fromARGB(255, 72, 60, 60), // Blue color at the top left
                                          Color.fromARGB(255, 31, 24, 24),
                                          // Green color at the bottom right
                                        ],
                                        stops: [
                                          0.0,
                                          1.0
                                        ], // Stops correspond to each color
                                      ),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Password', hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white
                                    ),
                                    onPressed: _toggleVisibility,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                obscureText: _obscureText,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    // Start and end points of the gradient relative to the container
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    // Colors used in the gradient
                                    colors: [
                                      CustomColors
                                          .sinColor1, // Blue color at the top left
                                      CustomColors.sinColr2,
                                      // Green color at the bottom right
                                    ],
                                    stops: [
                                      0.0,
                                      1.0
                                    ], // Stops correspond to each color
                                  ),
                                ),
                                child: const Center(
                                    child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ))),
                                 const SizedBox(height: 12,),
                                 Padding(
                                   padding: const EdgeInsets.fromLTRB(20, 0 ,20,0),
                                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                    Container(height: 2,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        // Start and end points of the gradient relative to the container
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        // Colors used in the gradient
                                        colors: [
                                          Colors.black,
                                          Color.fromARGB(255, 132, 124, 124), // Blue color at the top left
                                          // Green color at the bottom right
                                        ],
                                        stops: [
                                          0.0,
                                          1.0
                                        ], // Stops correspond to each color
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.black,
                                    ),
                                      
                                    ),
                                     const Text("or sign up with", style:
                                      TextStyle(color: Colors.white),),
                                      Container(height: 2,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        // Start and end points of the gradient relative to the container
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        // Colors used in the gradient
                                        colors: [
                                          Color.fromARGB(255, 132, 124, 124), // Blue color at the top left
                                          Colors.black,
                                          // Green color at the bottom right
                                        ],
                                        stops: [
                                          0.0,
                                          1.0
                                        ], // Stops correspond to each color
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.black,
                                    ),
                                      
                                    ),
                                   ],),
                                 ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        // Start and end points of the gradient relative to the container
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        // Colors used in the gradient
                                        colors: [
                                          Color.fromARGB(255, 132, 124,
                                              124), // Blue color at the top left
                                          Colors.black,
                                          // Green color at the bottom right
                                        ],
                                        stops: [
                                          0.0,
                                          1.0
                                        ], // Stops correspond to each color
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.black,
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                      'images/gpng.png',
                                      width: 20,
                                      height: 20,
                                    )),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        // Start and end points of the gradient relative to the container
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        // Colors used in the gradient
                                        colors: [
                                          Color.fromARGB(255, 132, 124,
                                              124), // Blue color at the top left
                                          Colors.black,
                                          // Green color at the bottom right
                                        ],
                                        stops: [
                                          0.0,
                                          1.0
                                        ], // Stops correspond to each color
                                      ),
                                      // color: Colors.black,
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                      'images/apple.png',
                                      fit: BoxFit.contain,
                                    )),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        // Start and end points of the gradient relative to the container
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        // Colors used in the gradient
                                        colors: [
                                          Color.fromARGB(255, 132, 124,
                                              124), // Blue color at the top left
                                          Colors.black,
                                          // Green color at the bottom right
                                        ],
                                        stops: [
                                          0.0,
                                          1.0
                                        ], // Stops correspond to each color
                                      ),
                                      // color: Colors.black,
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                      'images/face.png',
                                      height: 40,
                                      width: 40,
                                    )),
                                  ),
                                
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
