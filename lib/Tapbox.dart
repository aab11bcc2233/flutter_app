import 'package:flutter/material.dart';

class TapboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          TapboxA(),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          TapboxBParentWidget(),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          TapboxCParentWidget(),
        ],
      ),
    );
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TapboxAState();
  }
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? "Active" : "Inactive",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TapboxBParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TapboxBParentState();
  }
}

class _TapboxBParentState extends State<TapboxBParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
          child: Center(
            child: Text(
              active ? "Active" : "Inactive",
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ));
  }
}

class TapboxCParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TapboxCParentState();
  }
}

class _TapboxCParentState extends State<TapboxCParentWidget> {
  bool _active = false;

  void _handleTapboxChange(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChange,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  State<StatefulWidget> createState() {
    return _TapboxCState();
  }

}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? "Active" : "Inactive",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? Border.all(color: Colors.teal[700], width: 10.0) : null
        ),
      ),
    );
  }

}