package object;

import global.Data;

/**
 *
 * @author nick
 */
public class Gene {

    public static final String title
            = "GENE,"
            + "ALL_0.01%,"
            + "ALL_0.1%,"
            + "ALL_1%,"
            + "PP2_ALL_0.1%,"
            + "EA_0.1%,"
            + "EA_1%,"
            + "AA_0.1%,"
            + "AA_1%,"
            + "%OEratio,"
            + "%ExAC_0.1%popn,"
            + "%ExAC_0.05%popn,"
            + "%ExAC_0.01%";

    public String Gene;
    public String ALL_001_value;
    public String ALL_001_Percent;
    public String ALL_01_value;
    public String ALL_01_Percent;
    public String ALL_1_value;
    public String ALL_1_Percent;
    public String PP2_ALL_01_value;
    public String PP2_ALL_01_Percent;
    public String EA_01_value;
    public String EA_01_Percent;
    public String EA_1_value;
    public String EA_1_Percent;
    public String AA_01_value;
    public String AA_01_Percent;
    public String AA_1_value;
    public String AA_1_Percent;
    public String OEratio_value;
    public String OEratio_Percent;
    public String ExAC_01_Popn_Percent;
    public String ExAC_005_Popn_Percent;
    public String ExAC_001_Percent;

    public String getGene() {
        return Gene;
    }

    public String getALL_001() {
        return ALL_001_value + " (" + ALL_001_Percent + "%)";
    }

    public String getALL_01() {
        return ALL_01_value + " (" + ALL_01_Percent + "%)";
    }

    public String getALL_1() {
        return ALL_1_value + " (" + ALL_1_Percent + "%)";
    }

    public String getPP2_ALL_01() {
        return PP2_ALL_01_value + " (" + PP2_ALL_01_Percent + "%)";
    }

    public String getEA_01() {
        return EA_01_value + " (" + EA_01_Percent + "%)";
    }

    public String getEA_1() {
        return EA_1_value + " (" + EA_1_Percent + "%)";
    }

    public String getAA_01() {
        return AA_01_value + " (" + AA_01_Percent + "%)";
    }

    public String getAA_1() {
        return AA_1_value + " (" + AA_1_Percent + "%)";
    }

    public String getOEratio() {
        if (OEratio_Percent.equals(Data.NA)) {
            return Data.NA;
        } else {
            return OEratio_Percent + "%";
        }
    }

    public String getExAC_01_Popn() {
        return ExAC_01_Popn_Percent + "%";
    }

    public String getExAC_005_Popn() {
        return ExAC_005_Popn_Percent + "%";
    }

    public String getExAC_001() {
        return ExAC_001_Percent + "%";
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();

        sb.append(getGene()).append(",");
        sb.append(getALL_001()).append(",");
        sb.append(getALL_01()).append(",");
        sb.append(getALL_1()).append(",");
        sb.append(getPP2_ALL_01()).append(",");
        sb.append(getEA_01()).append(",");
        sb.append(getEA_1()).append(",");
        sb.append(getAA_01()).append(",");
        sb.append(getAA_1()).append(",");
        sb.append(getOEratio()).append(",");
        sb.append(getExAC_01_Popn()).append(",");
        sb.append(getExAC_005_Popn()).append(",");
        sb.append(getExAC_001());

        return sb.toString();
    }
}
