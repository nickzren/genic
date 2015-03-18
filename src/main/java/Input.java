import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Hashtable;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author nick
 */
public class Input {

    public static ArrayList<Integer> titleIndexList = new ArrayList<Integer>();
    public static HashSet<String> titleSet = new HashSet<String>();
    public static ArrayList<String> inputGeneList = new ArrayList<String>();
    public static ArrayList<String> geneNameList = new ArrayList<String>();
    public static Hashtable<String, String> geneNameTable = new Hashtable<String, String>();
    public static ArrayList<String> allGeneList = new ArrayList<String>();
    public static ArrayList<String> alternativeGeneNameList = new ArrayList<String>();
    public static String titleSetCheckBox[];
    public static Boolean isAllGene;
    public static Boolean isSelectAll;

    public static void init(HttpServletRequest request) throws Exception {
        titleIndexList.clear();
        titleSet.clear();
        inputGeneList.clear();
        geneNameList.clear();

        initAlternativeGeneNameList();

        initGeneList(request);

        initTitleIndexList(request);
    }

    public static void initAlternativeGeneNameList() throws Exception {
        File file = new File(Data.rootPath + File.separator + Data.GenicIntoleranceAlternativeGeneName);
        FileInputStream fstream = new FileInputStream(file);
        DataInputStream in = new DataInputStream(fstream);
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        String line;

        HashSet<String> tempSet = new HashSet<String>();
        String value = "";

        while ((line = br.readLine()) != null) {
            line = line.toUpperCase();

            for (String str : line.split(Data.TAB)) {
                if (tempSet.isEmpty()) {
                    tempSet.add(str);
                    value = str;
                } else {
                    if (!tempSet.contains(str)) {
                        value += Data.TAB + str;
                    }

                    tempSet.add(str);
                }
            }

            alternativeGeneNameList.add(value);
            tempSet.clear();
        }
    }

    private static void initGeneList(HttpServletRequest request) throws Exception {
        isAllGene = request.getParameter("allGene") != null;
        String geneName = request.getParameter("geneName");

        if (isAllGene) {
            if (allGeneList.isEmpty()) {
                File file = new File(Data.rootPath + File.separator + Data.INPUT_DATA);
                FileInputStream fstream = new FileInputStream(file);
                DataInputStream in = new DataInputStream(fstream);
                BufferedReader br = new BufferedReader(new InputStreamReader(in));
                String line;

                while ((line = br.readLine()) != null) {
                    String[] temp = line.split(Data.TAB);

                    if (!temp[0].equals("GENE")) { // ignore header
                        allGeneList.add(temp[0].toUpperCase());
                    }
                }
            }
        } else {
            String[] geneNames = geneName.replaceAll("( )+", "").replaceAll("\r", "").split("\n");

            for (String name : geneNames) {
                inputGeneList.add(name);

                name = getGeneName(name);

                if (name.isEmpty()) {
                    continue;
                }

                String[] temp = name.split(Data.TAB);

                geneNameList.add(temp[0]);
                geneNameTable.put(temp[0], temp[1]);
            }
        }
    }

    public static String getGeneName(String value) {
        for (String alternativeGeneNames : alternativeGeneNameList) {
            String[] names = alternativeGeneNames.split(Data.TAB);

            for (String name : names) {

                if (name.equalsIgnoreCase(value)) {
                    return names[0] + Data.TAB + name;
                }
            }
        }

        return "";
    }

    private static void initTitleIndexList(HttpServletRequest request) {
        isSelectAll = request.getParameter("selectAll") != null;
        titleSetCheckBox = request.getParameterValues("titleSet");

        if (isSelectAll || titleSetCheckBox == null) {
            for (int i = 0; i < Data.TITLE.length; i++) {
                titleIndexList.add(i);
            }
        }

        if (titleSetCheckBox != null) {
            for (String title : titleSetCheckBox) {
                titleSet.add(title);

                if (!isSelectAll) {
                    if (title.equals(Data.TITLE[0])) {
                        titleIndexList.add(0);
                    } else if (title.equals(Data.TITLE[1])) {
                        titleIndexList.add(1);
                    } else if (title.equals(Data.TITLE[2])) {
                        titleIndexList.add(2);
                    } else if (title.equals(Data.TITLE[3])) {
                        titleIndexList.add(3);
                    } else if (title.equals(Data.TITLE[4])) {
                        titleIndexList.add(4);
                    } else if (title.equals(Data.TITLE[5])) {
                        titleIndexList.add(5);
                    } else if (title.equals(Data.TITLE[6])) {
                        titleIndexList.add(6);
                    } else if (title.equals(Data.TITLE[7])) {
                        titleIndexList.add(7);
                    } else if (title.equals(Data.TITLE[8])) {
                        titleIndexList.add(8);
                    } else if (title.equals(Data.TITLE[9])) {
                        titleIndexList.add(9);
                    } else if (title.equals(Data.TITLE[10])) {
                        titleIndexList.add(10);
                    }
                }
            }
        } else {
            isSelectAll = true;
        }
    }
}
