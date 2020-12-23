import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PDFViewer extends StatefulWidget {
	
	final String pdf;
	const PDFViewer({Key key, this.pdf}) : super(key: key);
	
	@override
	_PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
	
	String localFile ;
	
	Future<String> getFile() async{
		http.Response response;
		try {
			response = await http.get(widget.pdf);
			
			var dir = await getTemporaryDirectory();
			File file = File(dir.path + "/data.pdf");
			await file.writeAsBytes(response.bodyBytes, flush: true);
			print("success");
			return file.path;
		}catch(e){
			print(e);
		}
	}
	
	@override
	void initState() {
		super.initState();
		getFile().then((value){
			setState(() {
				localFile = value;
			});
		});
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("File View"),
			),
			
			body: Container(
					padding: EdgeInsets.all(20),
					child: localFile != null?
					PDFView(
						filePath: localFile,
					):
					Center(
						child: CircularProgressIndicator(
							valueColor: AlwaysStoppedAnimation<Color>
								(Colors.white),
						),
					)
			),
		);
	}
}