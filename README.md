Script to correct exif data on photos I was uploading to Photos on my Mac.

Per `exiftool -a thefilename.jpeg` they had the correct "Date/Time Original"
but Photos was using the modified at date. The script sets the latter to the
former.

Ruby version 3.1.2 used.
