package igm.genic.model;



import igm.genic.object.Gene;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

/**
 *
 * @author nick
 */
public class Download {

    public static String rootPath;
    public static String url;

    public static void init() throws Exception {
        url = "";
    }

    public static void generateFile() throws Exception {
        if (!Output.geneList.isEmpty()) { // TRUE - no results from search query
            String folderPath = rootPath + File.separator;

            folderPath += Input.query.contains(",") ? "genes" : "gene";

            File folder = new File(folderPath);

            if (!folder.exists()) {
                folder.mkdir();
            }

            String fileName = Input.query.replaceAll("\\s+", "") + ".csv";

            String filePath = folder.getAbsolutePath() + File.separator + fileName;

            File file = new File(filePath);

            if (!file.exists()) {
                BufferedWriter bw = new BufferedWriter(new FileWriter(filePath));

                bw.write(Gene.title);
                bw.newLine();

                for (Gene gene : Output.geneList) {
                    bw.write(gene.toString());
                    bw.newLine();
                }

                bw.flush();
                bw.close();
            }

            url = "./download/" + folder.getName() + "/" + fileName;
        }
    }
}
