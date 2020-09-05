ifeq ($(OS), Windows_NT)
	RMALL=del /s
	RMDIR=rmdir /s /q
else
	RMALL=rm -f
	RMDIR=rm -rf
endif

.PHONY : clean

build :
	quartus_sh --flow compile menu -c menu
clean :
	$(RMALL) *.bak *.orig *.rej  *~ *.qws *.ppf *.ddb *.csv *.cmp *.sip *.spd \
	*.bsf *.f *.sopcinfo *.xml *.cdf *.rpt build_id.v c5_pin_model_dump.txt \
	PLLJ_PLLSPE_INFO.txt new_rtl_netlist old_rtl_netlist
	$(RMDIR) db incremental_db output_files simulation greybox_tmp hc_output \
	.qsys_edit hps_isw_handoff sys\.qsys_edit sys\vip
	find . -name '*_sim' -exec $(RMDIR) {} \;
