import cv2


output_path = '/Users/guieenoutis/Documents/ml-projects/mediapipe/template_matching_assets/input/calendar.png'

img = cv2.imread('/Users/guieenoutis/Documents/ml-projects/mediapipe/template_matching_assets/original/calendar.png')

print(img.shape)
print(len(img.shape))
# cv2.imshow('image',img)

# In case of grayScale images the len(img.shape) == 2
# if len(img.shape) > 2 and img.shape[2] == 4:
#convert the image from RGBA2RGB
img = cv2.cvtColor(img, cv2.COLOR_BGRA2BGR)
cv2.imwrite(output_path,img)

