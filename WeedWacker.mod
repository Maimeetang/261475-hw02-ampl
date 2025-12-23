set trimmers;
set electric_trimmer;
set gas_trimmer;

param price {trimmers};

param electric_demand;
param gas_demand;

param production_use {trimmers};
param assembly_use   {trimmers};
param packaging_use  {trimmers};

param production_avil;
param assembly_avil;
param packaging_avil;

var x {trimmers} >= 0;

minimize total_cost:
    sum{i in trimmers} price[i] * x[i]
;

s.t. ContractElectric:
    sum {i in electric_trimmer} x[i] >= electric_demand;

s.t. ContractGas:
    sum {i in gas_trimmer} x[i] >= gas_demand;


s.t. production:
    sum {i in trimmers} production_use[i] * x[i] <= production_avil
;

s.t. assembly:
    sum {i in trimmers} assembly_use[i] * x[i] <= assembly_avil
;

s.t. packaging:
    sum {i in trimmers} packaging_use[i] * x[i] <= packaging_avil
;