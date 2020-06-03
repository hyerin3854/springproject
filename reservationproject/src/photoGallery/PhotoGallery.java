package photoGallery;

import java.io.File;
import java.io.IOException;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
 
  
public class PhotoGallery 
{
   public PhotoGallery() {}
	
   public static void createImage(String loadFile, String saveFile,int zoom) 
	   throws IOException
	{	
		
			File  save = new File(saveFile);
			RenderedOp rOp = JAI.create("fileload", loadFile);
	     	BufferedImage im = rOp.getAsBufferedImage();
	     	
	     	if(zoom <= 0) zoom = 1;
	     	
	     	int width = im.getWidth()  / zoom;
	     	int height = im.getHeight() / zoom;
			
			BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics2D 	g2 = thumb.createGraphics();
						
			g2.drawImage(im, 0, 0, width, height, null);
						
			ImageIO.write(thumb, "jpg", save);
	}	
}