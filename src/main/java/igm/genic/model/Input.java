package igm.genic.model;


import igm.genic.global.Data;
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
    public static ArrayList<String> geneNameList = new ArrayList<String>();
    public static Hashtable<String, String> geneNameTable = new Hashtable<String, String>();
    public static ArrayList<String> allGeneList = new ArrayList<String>();
    public static ArrayList<String> alternativeGeneNameList = new ArrayList<String>();
    public static ArrayList<String> invalidGeneList = new ArrayList<String>();

    public static String query;

    public static void init(HttpServletRequest request) throws Exception {
        titleIndexList.clear();
        geneNameList.clear();
        invalidGeneList.clear();

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
        query = request.getParameter("query");

        String[] geneNames = query.replaceAll("\\s+", "").split(",");

        for (String name : geneNames) {
            String alternativeName = getGeneName(name);

            if (alternativeName.isEmpty()) {
                invalidGeneList.add(name);
                continue;
            }

            String[] temp = alternativeName.split(Data.TAB);

            geneNameList.add(temp[0]);
            geneNameTable.put(temp[0], temp[1]);
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
        for (int i = 0; i < Data.TITLE.length; i++) {
            titleIndexList.add(i);
        }
    }
}
