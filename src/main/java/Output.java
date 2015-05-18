
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author nick
 */
public class Output {

    public static String title;
    public static ArrayList<String> valueList;
    private static HashMap<String, String> valueMap;
    public static File resultFolder;
    public static File resultFile;
    public static String url;

    public static void init() throws Exception {
        title = "Gene Name";
        valueList = new ArrayList<String>();
        valueMap = new HashMap<String, String>();

        for (int index : Input.titleIndexList) {
            title += Data.COMMA + Data.TITLE[index];
        }

        initOutputList();
    }

    private static void initOutputList() throws Exception {
        File file = new File(Data.rootPath + File.separator + Data.INPUT_DATA);
        FileInputStream fstream = new FileInputStream(file);
        DataInputStream in = new DataInputStream(fstream);
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        String line;

        ArrayList<String> geneNameList = Input.geneNameList;

        while ((line = br.readLine()) != null) {
            String[] temp = line.split(Data.TAB);

            temp[0] = temp[0].toUpperCase();

            String value = temp[0];

            if (geneNameList.contains(value)) {
                value = Input.geneNameTable.get(value);

                for (int index : Input.titleIndexList) {
                    if (Data.TITLE[index].equals("OEratio")) {
                        index = 2 * index + 1;

                        if (temp[index + 1].equals(Data.NA)) {
                            value += Data.COMMA + temp[index + 1];
                        } else {
                            value += Data.COMMA + temp[index + 1] + "%";
                        }
                    } else if (Data.TITLE[index].equals("ExAC_0.1%")) {
                        index = 19;

                        value += Data.COMMA + temp[index] + "%";
                    } else if (Data.TITLE[index].startsWith("ExAC_0.05%")) {
                        index = 20;

                        value += Data.COMMA + temp[index] + "%";
                    } else {
                        index = 2 * index + 1;

                        value += Data.COMMA + temp[index];

                        value += " (" + temp[index + 1] + "%)";
                    }
                }

                valueMap.put(temp[0], value);
            }
        }

        for (String geneName : geneNameList) {
            String value = valueMap.get(geneName);
            if (value != null) {
                Output.valueList.add(value);
            } else {
//                invalidGeneList.add(geneName);
            }
        }
    }

    public static void run() {
        if (!Output.valueList.isEmpty()) {
            Date date = new Date();
            String resultFolderPath = date.toString().replaceAll(":", "_").replaceAll(" ", "_");

            resultFolder = new File(Data.rootPath + File.separator + resultFolderPath);
            if (!resultFolder.isDirectory()) {
                resultFolder.mkdir();
            }

            String resultFilePath = resultFolder.getAbsolutePath() + File.separator + "result.csv";
            resultFile = new File(resultFilePath);

            try {
                BufferedWriter bw = new BufferedWriter(new FileWriter(resultFilePath));

                bw.write(title);
                bw.newLine();

                for (String value : valueList) {
                    bw.write(value);
                    bw.newLine();
                }

                bw.flush();
                bw.close();
            } catch (IOException ex) {
//                ErrorManager.send(ex);
            }

            url = "./data/" + resultFolder.getName() + "/result.csv";
        }
    }
}
