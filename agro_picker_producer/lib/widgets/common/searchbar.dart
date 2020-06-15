import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final String hintText;
  final Function searchForText;

  SearchBar(this.hintText, this.searchForText);

  @override
  State<StatefulWidget> createState() {
    return _SearchBar();
  }
}

class _SearchBar extends State<SearchBar> {
  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 75,
            child: TextFormField(
              textInputAction: TextInputAction.search,
              controller: searchTextController,
              style: TextStyle(fontSize: 15),
              autovalidate: true,
              onFieldSubmitted: (value) {
                FocusScope.of(context).unfocus();
                widget.searchForText(value.trim());
              },
              decoration: InputDecoration(
                suffixIcon: searchTextController.text.isEmpty
                    ? InkWell(
                        child: Icon(Icons.search),
                        onTap: () {
                          widget
                              .searchForText(searchTextController.text.trim());
                        },
                      )
                    : InkWell(
                        child: Icon(Icons.clear),
                        onTap: () {
                          searchTextController.clear();
                        },
                      ),
                hintText: widget.hintText,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                contentPadding:
                    EdgeInsets.only(top: 0, bottom: 10, left: 10, right: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
