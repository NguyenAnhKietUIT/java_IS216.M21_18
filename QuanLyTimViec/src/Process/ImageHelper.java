package Process;

import java.awt.Image;

/**
 *
 * @author acer
 */
public class ImageHelper {
    public static Image resize(Image originalImage, int targetWidth, int targetHeight) {
        Image resultingImage = originalImage.getScaledInstance(targetWidth, targetHeight, Image.SCALE_SMOOTH);
        return resultingImage;
    }
}
