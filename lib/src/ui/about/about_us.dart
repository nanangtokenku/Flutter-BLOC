import 'package:flutter/material.dart';
import 'package:aztira/src//utils/app_tool.dart';
import 'package:aztira/src/utils/keys.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About",
          key: ValueKey(AboutUsKeys.TITLE_ABOUT),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.bug_report, color: Colors.black),
                        title: Text(
                          "Report an Issue",
                          key: ValueKey(AboutUsKeys.TITLE_REPORT),
                        ),
                        subtitle: Text(
                          "Having an issue ? Report it here",
                          key: ValueKey(AboutUsKeys.SUBTITLE_REPORT),
                        ),
                        onTap: () => launchURL("https://jogjaide.web.id")),
                    ListTile(
                      leading: Icon(Icons.update, color: Colors.black),
                      title: Text("Version"),
                      subtitle: Text(
                        "1.0.0",
                        key: ValueKey(AboutUsKeys.VERSION_NUMBER),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: Text("Author",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: FONT_MEDIUM)),
                    ),
                    ListTile(
                      leading: Icon(Icons.perm_identity, color: Colors.black),
                      title: Text(
                        "Nanang Rustianto",
                        key: ValueKey(AboutUsKeys.AUTHOR_NAME),
                      ),
                      subtitle: Text(
                        "v13nr2",
                        key: ValueKey(AboutUsKeys.AUTHOR_USERNAME),
                      ),
                      //onTap: () => launchURL(GITHUB_URL),
                    ),
                    ListTile(
                        leading: Icon(Icons.bug_report, color: Colors.black),
                        title: Text("Fork on Github"),
                        onTap: () => launchURL(
                            "https://github.com/nanangtokenku/Flutter-BLOC")),
                    ListTile(
                        leading: Icon(Icons.email, color: Colors.black),
                        title: Text("Send an Email"),
                        subtitle: Text(
                          "nanang.tokenku@gmail.com",
                          key: ValueKey(AboutUsKeys.AUTHOR_EMAIL),
                        ),
                        onTap: () => launchURL("https://jogjaide.web.id")),
                  ],
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: Text("Ask Question ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: FONT_MEDIUM)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset(
                              "assets/twitter_logo.png",
                              scale: 8.75,
                            ),
                            onPressed: () =>
                                launchURL("https://jogjaide.web.id"),
                          ),
                          IconButton(
                            icon: Image.asset("assets/facebook_logo.png"),
                            onPressed: () => launchURL(
                                "https://facebook.com/nanang.rustianto"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: Text("Apache Licensee",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: FONT_MEDIUM)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        subtitle: Text("Copyright 2023 Nanang Rustianto"
                            '\n\nLicensed under the Apache License, Version 2.0 (the "License") you may not use this file except in compliance with the License. You may obtain a copy of the License at'
                            "\n\n\nhttp://www.apache.org/licenses/LICENSE-2.0"
                            '\n\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
