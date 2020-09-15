import 'package:flutter/material.dart';
import 'package:flutter_treeview/tree_view.dart';

bool docsOpen = true;

List<Node> nodes = [
  Node(
    label: 'Documents',
    key: 'docs',
    expanded: true,
    icon: NodeIcon(
      codePoint:
          docsOpen ? Icons.folder_open.codePoint : Icons.folder.codePoint,
      color: "blue",
    ),
    children: [
      Node(
          label: 'Job Search',
          key: 'd3',
          icon: NodeIcon.fromIconData(Icons.input),
          children: [
            Node(
                label: 'Resume.docx',
                key: 'pd1',
                icon: NodeIcon.fromIconData(Icons.insert_drive_file),
                children: [
                  Node(
                      label: '123',
                      key: 'pdd1',
                      icon: NodeIcon.fromIconData(Icons.input)),
                  Node(
                      label: '123',
                      key: 'pdd2',
                      icon: NodeIcon.fromIconData(Icons.input)),
                  Node(
                      label: '123',
                      key: 'pdd3',
                      icon: NodeIcon.fromIconData(Icons.input)),
                  Node(
                      label: '123',
                      key: 'pdd4',
                      icon: NodeIcon.fromIconData(Icons.input)),
                ]),
            Node(
                label: 'Cover Letter.docx',
                key: 'pd2',
                icon: NodeIcon.fromIconData(Icons.insert_drive_file)),
          ]),
      Node(
        label: 'Inspection.docx',
        key: 'd1',
      ),
      Node(
          label: 'Invoice.docx',
          key: 'd2',
          icon: NodeIcon.fromIconData(Icons.insert_drive_file)),
    ],
  ),
  Node(
      label: 'MeetingReport.xls',
      key: 'mrxls',
      icon: NodeIcon.fromIconData(Icons.insert_drive_file)),
  Node(
      label: 'MeetingReport.pdf',
      key: 'mrpdf',
      icon: NodeIcon.fromIconData(Icons.insert_drive_file)),
  Node(
      label: 'Demo.zip',
      key: 'demo',
      icon: NodeIcon.fromIconData(Icons.archive)),
];

TreeViewController _treeViewController = TreeViewController(children: nodes);

TreeViewTheme _treeViewTheme = TreeViewTheme(
  expanderTheme: ExpanderThemeData(
    type: ExpanderType.caret,
    modifier: ExpanderModifier.none,
    position: ExpanderPosition.start,
    color: Colors.red.shade800,
    size: 20,
  ),
  labelStyle: TextStyle(
    fontSize: 16,
    letterSpacing: 0.3,
  ),
  parentLabelStyle: TextStyle(
    fontSize: 16,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w800,
    color: Colors.red.shade600,
  ),
  iconTheme: IconThemeData(
    size: 18,
    color: Colors.grey.shade800,
  ),
  colorScheme: ColorScheme.light(),
);

class FlutterTreeViewWidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FlutterTreeViewWidgetDemoState();
}

class _FlutterTreeViewWidgetDemoState extends State<FlutterTreeViewWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    // 安全区
    return SafeArea(
      // InkWell Class will always work with a Material Class
      child: Material(
        child: TreeView(
            controller: _treeViewController,
            allowParentSelect: false,
            supportParentDoubleTap: false,
            onExpansionChanged: (s, b) {
              debugPrint("onExpansionChanged:$s, $b");
            },
            onNodeTap: (key) {
              debugPrint("onNodeTap: $key");
              setState(() {
                _treeViewController =
                    _treeViewController.copyWith(selectedKey: key);
              });
            },
            theme: _treeViewTheme),
      ),
    );
  }
}
