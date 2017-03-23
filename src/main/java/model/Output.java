package model;

import object.Gene;
import global.Data;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author nick
 */
public class Output {

    public static ArrayList<Gene> geneList;
    private static HashMap<String, Gene> geneMap;

    public static void init() throws Exception {
        geneList = new ArrayList<Gene>();

        geneMap = new HashMap<String, Gene>();

        initOutputList();
    }

    private static void initOutputList() throws Exception {
        File file = new File(Data.rootPath + File.separator + Data.INPUT_DATA);
        FileInputStream fstream = new FileInputStream(file);
        DataInputStream in = new DataInputStream(fstream);
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        String line;

        while ((line = br.readLine()) != null) {
            String[] temp = line.split(Data.TAB);

            temp[0] = temp[0].toUpperCase();

            if (Input.geneNameList.contains(temp[0])) {
                Gene gene = new Gene();
                gene.Gene = temp[0];
                gene.ALL_01_Value = temp[1];
                gene.ALL_01_Percent = getPercentile(temp[2]);
                gene.OEratio_Percent = getPercentile(temp[3]);
                gene.ExAC_005_Popn_Percent = getPercentile(temp[4]);
                gene.OEratio_Percentile_ExAC = getPercentile(temp[5]);
                gene.LoF_FDR_ExAC = temp[6];
                gene.ExAC_v2_005_Popn_value = temp[7];
                gene.ExAC_v2_005_Popn_Percent = getPercentile(temp[8]);
                gene.Edge_Case_ExAC_v2 = temp[9];
                gene.OEratio_percentile_ExAC_v2 = getPercentile(temp[10]);

                geneMap.put(gene.Gene, gene);
            }
        }

        // generate gene list base on user input order
        for (String geneName : Input.geneNameList) {
            Gene gene = geneMap.get(geneName);
            if (gene != null) {
                Output.geneList.add(gene);
            }
        }
    }

    private static String getPercentile(String value) {
        if (value.equals(Data.NA)) {
            return Data.NA;
        } else {
            return value + "%";
        }
    }
}
