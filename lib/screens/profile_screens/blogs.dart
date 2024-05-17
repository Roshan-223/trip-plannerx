import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key});

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  final String blogBoxName = 'blogs';
  late Box<String>? blogBox; // Declare the box as nullable
  late TextEditingController blogController;

  @override
  void initState() {
    super.initState();
    blogController = TextEditingController();
    openBlogBox(); // Open the blog box
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    blogController.dispose();
    super.dispose();
  }

  Future<void> openBlogBox() async {
    blogBox = await Hive.openBox<String>(blogBoxName);
    if (mounted) {
      setState(() {}); // Update the state to trigger a rebuild
    }
  }

  Future<void> _addBlog() async {
    final String blogText = blogController.text.trim();
    if (blogText.isNotEmpty && blogBox != null) {
      blogBox!.add(blogText);
      setState(() {
        blogController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs'),
      ),
      body: blogBox == null
          ? const Center(
              child:
                  CircularProgressIndicator(), // Show loading indicator while box is being opened
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: blogBox!.length,
                    itemBuilder: (context, index) {
                      final blog = blogBox!.getAt(index);
                      return ListTile(
                        title: Text(blog ?? ''),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _editBlog(context, index, blog);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _confirmDelete(context, index);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: blogController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your blog here',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: _addBlog,
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void _editBlog(BuildContext context, int index, String? blog) {
    // TextEditingController for the edit dialog
    TextEditingController editController = TextEditingController(text: blog);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Blog"),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(
              hintText: 'Enter your edited blog here',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final String editedBlog = editController.text.trim();
                if (editedBlog.isNotEmpty && blogBox != null) {
                  blogBox!
                      .putAt(index, editedBlog); // Update the blog in the box
                  setState(() {}); // Update the UI
                }
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to delete this blog?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (blogBox != null) {
                  blogBox!.deleteAt(index);
                  setState(() {});
                }
                Navigator.of(context).pop();
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
