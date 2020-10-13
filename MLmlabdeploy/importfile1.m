function tableout = importfile1(workbookFile,sheetName,startRow,endRow)
%IMPORTFILE1 Import data from a spreadsheet
%   DATA = IMPORTFILE1(FILE) reads data from the first worksheet in the
%   Microsoft Excel spreadsheet file named FILE and returns the data as a
%   table.
%
%   DATA = IMPORTFILE1(FILE,SHEET) reads from the specified worksheet.
%
%   DATA = IMPORTFILE1(FILE,SHEET,STARTROW,ENDROW) reads from the specified
%   worksheet for the specified row interval(s). Specify STARTROW and
%   ENDROW as a pair of scalars or vectors of matching size for
%   dis-contiguous row intervals. To read to the end of the file specify an
%   ENDROW of inf.
%
%	Non-numeric cells are replaced with: NaN
%
% Example:
%   HSIdata1hbinclass = importfile1('HSIdata1hbinclass.xlsx','Sheet1',2,108);
%
%   See also XLSREAD.

% 

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% If row start and end points are not specified, define defaults
if nargin <= 3
    startRow = 2;
    endRow = 108;
end

%% Import the data
[~, ~, raw] = xlsread(workbookFile, sheetName, sprintf('A%d:IW%d',startRow(1),endRow(1)));
for block=2:length(startRow)
    [~, ~, tmpRawBlock] = xlsread(workbookFile, sheetName, sprintf('A%d:IW%d',startRow(block),endRow(block)));
    raw = [raw;tmpRawBlock]; %#ok<AGROW>
end
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
stringVectors = string(raw(:,[1,2]));
stringVectors(ismissing(stringVectors)) = '';
raw = raw(:,[3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257]);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
I = cellfun(@(x) ischar(x), raw);
raw(I) = {NaN};
data = reshape([raw{:}],size(raw));

%% Create table
tableout = table;

%% Allocate imported array to column variable names
tableout.Identifiersnull = stringVectors(:,1);
tableout.Class = categorical(stringVectors(:,2));
tableout.VarName3 = data(:,1);
tableout.VarName4 = data(:,2);
tableout.VarName5 = data(:,3);
tableout.VarName6 = data(:,4);
tableout.VarName7 = data(:,5);
tableout.VarName8 = data(:,6);
tableout.VarName9 = data(:,7);
tableout.VarName10 = data(:,8);
tableout.VarName11 = data(:,9);
tableout.VarName12 = data(:,10);
tableout.VarName13 = data(:,11);
tableout.VarName14 = data(:,12);
tableout.VarName15 = data(:,13);
tableout.VarName16 = data(:,14);
tableout.VarName17 = data(:,15);
tableout.VarName18 = data(:,16);
tableout.VarName19 = data(:,17);
tableout.VarName20 = data(:,18);
tableout.VarName21 = data(:,19);
tableout.VarName22 = data(:,20);
tableout.VarName23 = data(:,21);
tableout.VarName24 = data(:,22);
tableout.VarName25 = data(:,23);
tableout.VarName26 = data(:,24);
tableout.VarName27 = data(:,25);
tableout.VarName28 = data(:,26);
tableout.VarName29 = data(:,27);
tableout.VarName30 = data(:,28);
tableout.VarName31 = data(:,29);
tableout.VarName32 = data(:,30);
tableout.VarName33 = data(:,31);
tableout.VarName34 = data(:,32);
tableout.VarName35 = data(:,33);
tableout.VarName36 = data(:,34);
tableout.VarName37 = data(:,35);
tableout.VarName38 = data(:,36);
tableout.VarName39 = data(:,37);
tableout.VarName40 = data(:,38);
tableout.VarName41 = data(:,39);
tableout.VarName42 = data(:,40);
tableout.VarName43 = data(:,41);
tableout.VarName44 = data(:,42);
tableout.VarName45 = data(:,43);
tableout.VarName46 = data(:,44);
tableout.VarName47 = data(:,45);
tableout.VarName48 = data(:,46);
tableout.VarName49 = data(:,47);
tableout.VarName50 = data(:,48);
tableout.VarName51 = data(:,49);
tableout.VarName52 = data(:,50);
tableout.VarName53 = data(:,51);
tableout.VarName54 = data(:,52);
tableout.VarName55 = data(:,53);
tableout.VarName56 = data(:,54);
tableout.VarName57 = data(:,55);
tableout.VarName58 = data(:,56);
tableout.VarName59 = data(:,57);
tableout.VarName60 = data(:,58);
tableout.VarName61 = data(:,59);
tableout.VarName62 = data(:,60);
tableout.VarName63 = data(:,61);
tableout.VarName64 = data(:,62);
tableout.VarName65 = data(:,63);
tableout.VarName66 = data(:,64);
tableout.VarName67 = data(:,65);
tableout.VarName68 = data(:,66);
tableout.VarName69 = data(:,67);
tableout.VarName70 = data(:,68);
tableout.VarName71 = data(:,69);
tableout.VarName72 = data(:,70);
tableout.VarName73 = data(:,71);
tableout.VarName74 = data(:,72);
tableout.VarName75 = data(:,73);
tableout.VarName76 = data(:,74);
tableout.VarName77 = data(:,75);
tableout.VarName78 = data(:,76);
tableout.VarName79 = data(:,77);
tableout.VarName80 = data(:,78);
tableout.VarName81 = data(:,79);
tableout.VarName82 = data(:,80);
tableout.VarName83 = data(:,81);
tableout.VarName84 = data(:,82);
tableout.VarName85 = data(:,83);
tableout.VarName86 = data(:,84);
tableout.VarName87 = data(:,85);
tableout.VarName88 = data(:,86);
tableout.VarName89 = data(:,87);
tableout.VarName90 = data(:,88);
tableout.VarName91 = data(:,89);
tableout.VarName92 = data(:,90);
tableout.VarName93 = data(:,91);
tableout.VarName94 = data(:,92);
tableout.VarName95 = data(:,93);
tableout.VarName96 = data(:,94);
tableout.VarName97 = data(:,95);
tableout.VarName98 = data(:,96);
tableout.VarName99 = data(:,97);
tableout.VarName100 = data(:,98);
tableout.VarName101 = data(:,99);
tableout.VarName102 = data(:,100);
tableout.VarName103 = data(:,101);
tableout.VarName104 = data(:,102);
tableout.VarName105 = data(:,103);
tableout.VarName106 = data(:,104);
tableout.VarName107 = data(:,105);
tableout.VarName108 = data(:,106);
tableout.VarName109 = data(:,107);
tableout.VarName110 = data(:,108);
tableout.VarName111 = data(:,109);
tableout.VarName112 = data(:,110);
tableout.VarName113 = data(:,111);
tableout.VarName114 = data(:,112);
tableout.VarName115 = data(:,113);
tableout.VarName116 = data(:,114);
tableout.VarName117 = data(:,115);
tableout.VarName118 = data(:,116);
tableout.VarName119 = data(:,117);
tableout.VarName120 = data(:,118);
tableout.VarName121 = data(:,119);
tableout.VarName122 = data(:,120);
tableout.VarName123 = data(:,121);
tableout.VarName124 = data(:,122);
tableout.VarName125 = data(:,123);
tableout.VarName126 = data(:,124);
tableout.VarName127 = data(:,125);
tableout.VarName128 = data(:,126);
tableout.VarName129 = data(:,127);
tableout.VarName130 = data(:,128);
tableout.VarName131 = data(:,129);
tableout.VarName132 = data(:,130);
tableout.VarName133 = data(:,131);
tableout.VarName134 = data(:,132);
tableout.VarName135 = data(:,133);
tableout.VarName136 = data(:,134);
tableout.VarName137 = data(:,135);
tableout.VarName138 = data(:,136);
tableout.VarName139 = data(:,137);
tableout.VarName140 = data(:,138);
tableout.VarName141 = data(:,139);
tableout.VarName142 = data(:,140);
tableout.VarName143 = data(:,141);
tableout.VarName144 = data(:,142);
tableout.VarName145 = data(:,143);
tableout.VarName146 = data(:,144);
tableout.VarName147 = data(:,145);
tableout.VarName148 = data(:,146);
tableout.VarName149 = data(:,147);
tableout.VarName150 = data(:,148);
tableout.VarName151 = data(:,149);
tableout.VarName152 = data(:,150);
tableout.VarName153 = data(:,151);
tableout.VarName154 = data(:,152);
tableout.VarName155 = data(:,153);
tableout.VarName156 = data(:,154);
tableout.VarName157 = data(:,155);
tableout.VarName158 = data(:,156);
tableout.VarName159 = data(:,157);
tableout.VarName160 = data(:,158);
tableout.VarName161 = data(:,159);
tableout.VarName162 = data(:,160);
tableout.VarName163 = data(:,161);
tableout.VarName164 = data(:,162);
tableout.VarName165 = data(:,163);
tableout.VarName166 = data(:,164);
tableout.VarName167 = data(:,165);
tableout.VarName168 = data(:,166);
tableout.VarName169 = data(:,167);
tableout.VarName170 = data(:,168);
tableout.VarName171 = data(:,169);
tableout.VarName172 = data(:,170);
tableout.VarName173 = data(:,171);
tableout.VarName174 = data(:,172);
tableout.VarName175 = data(:,173);
tableout.VarName176 = data(:,174);
tableout.VarName177 = data(:,175);
tableout.VarName178 = data(:,176);
tableout.VarName179 = data(:,177);
tableout.VarName180 = data(:,178);
tableout.VarName181 = data(:,179);
tableout.VarName182 = data(:,180);
tableout.VarName183 = data(:,181);
tableout.VarName184 = data(:,182);
tableout.VarName185 = data(:,183);
tableout.VarName186 = data(:,184);
tableout.VarName187 = data(:,185);
tableout.VarName188 = data(:,186);
tableout.VarName189 = data(:,187);
tableout.VarName190 = data(:,188);
tableout.VarName191 = data(:,189);
tableout.VarName192 = data(:,190);
tableout.VarName193 = data(:,191);
tableout.VarName194 = data(:,192);
tableout.VarName195 = data(:,193);
tableout.VarName196 = data(:,194);
tableout.VarName197 = data(:,195);
tableout.VarName198 = data(:,196);
tableout.VarName199 = data(:,197);
tableout.VarName200 = data(:,198);
tableout.VarName201 = data(:,199);
tableout.VarName202 = data(:,200);
tableout.VarName203 = data(:,201);
tableout.VarName204 = data(:,202);
tableout.VarName205 = data(:,203);
tableout.VarName206 = data(:,204);
tableout.VarName207 = data(:,205);
tableout.VarName208 = data(:,206);
tableout.VarName209 = data(:,207);
tableout.VarName210 = data(:,208);
tableout.VarName211 = data(:,209);
tableout.VarName212 = data(:,210);
tableout.VarName213 = data(:,211);
tableout.VarName214 = data(:,212);
tableout.VarName215 = data(:,213);
tableout.VarName216 = data(:,214);
tableout.VarName217 = data(:,215);
tableout.VarName218 = data(:,216);
tableout.VarName219 = data(:,217);
tableout.VarName220 = data(:,218);
tableout.VarName221 = data(:,219);
tableout.VarName222 = data(:,220);
tableout.VarName223 = data(:,221);
tableout.VarName224 = data(:,222);
tableout.VarName225 = data(:,223);
tableout.VarName226 = data(:,224);
tableout.VarName227 = data(:,225);
tableout.VarName228 = data(:,226);
tableout.VarName229 = data(:,227);
tableout.VarName230 = data(:,228);
tableout.VarName231 = data(:,229);
tableout.VarName232 = data(:,230);
tableout.VarName233 = data(:,231);
tableout.VarName234 = data(:,232);
tableout.VarName235 = data(:,233);
tableout.VarName236 = data(:,234);
tableout.VarName237 = data(:,235);
tableout.VarName238 = data(:,236);
tableout.VarName239 = data(:,237);
tableout.VarName240 = data(:,238);
tableout.VarName241 = data(:,239);
tableout.VarName242 = data(:,240);
tableout.VarName243 = data(:,241);
tableout.VarName244 = data(:,242);
tableout.VarName245 = data(:,243);
tableout.VarName246 = data(:,244);
tableout.VarName247 = data(:,245);
tableout.VarName248 = data(:,246);
tableout.VarName249 = data(:,247);
tableout.VarName250 = data(:,248);
tableout.VarName251 = data(:,249);
tableout.VarName252 = data(:,250);
tableout.VarName253 = data(:,251);
tableout.VarName254 = data(:,252);
tableout.VarName255 = data(:,253);
tableout.VarName256 = data(:,254);
tableout.VarName257 = data(:,255);

%save mytestdata1 tableout;