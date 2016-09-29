# Thumb Grid Demo
#### This is a project to demo the UICollectionView control in an application that presents a grid of cells that when clicked, launches a modal view showing a video along with text describing the scene. It's basically a master-view setup using the UICollectionView instead of the typical UITableView.

The UICollectionView data source is the .plist file labeled as *Items.plist*. The file is an array of dictionaries with the following keys: **topic**, **thumbnail**, **label**, **description**, **descTitle**, and **video**.
* topic: A descriptive word or phrase used to indicate a general subject area that the item belongs to.
* thumbnail: Filename of the .png that serves as a thumbnail for the item.
* label: Text that describes the item and appears beneath the thumbnail in the main grid view.
* description: The full text describing the item appearing on the detail view.
* descTitle: A title describing the video appearing on the detail view.
* video: Filename of the video to be displayed on the detail view.

Sample videos, thumbnails, and an Items.plist file can be found here: [http://pinyonsoft.com/ThumbGridDemoItems.zip](http://pinyonsoft.com/ThumbGridDemoItems.zip)
**Videos are all [CC0](https://creativecommons.org/share-your-work/public-domain/cc0/) "No Rights Reserved" and are free for you to use.**
