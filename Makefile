all: plot1 plot2 plot3 plot4

# Comparison of Binders
plot1:
	python plot.py \
		--in-data-csv combined.csv \
		--out-file comparison-of-binders \
		--out-dir plots \
		--title "Comparison of Binders" \
			--columns wheatstarch_Mon \
			--columns potatostarch_Mon \
			--columns carrageenan_Mon \
			--columns gumarabic_Mon \
			--columns gumtragacanth_Mon \
			--labels "Wheat starch" \
			--labels "Potato starch" \
			--labels "Carrageenan" \
			--labels "Gum Arabic" \
			--labels "Gum Tragacanth"

# Ultramarine Samples
plot2:
	python plot.py \
		--in-data-csv combined.csv \
		--out-file ultramarine-samples \
		--out-dir plots \
		--title "Ultramarine Samples" \
			--columns Ultramarine_gumarabic_Mon \
			--columns Ultramarine_gum \
			--columns Ultramarine_carrageenan_Mon \
			--columns ultramarine_dextrine_glycerol_Mon \
			--columns ultramarine_glucose_sodiumcarbonate_Mon \
			--columns Reckittscrownblue_Mon \
			--columns Reckittandcolemansquareblue_Mon \
			--labels "Ultramarine + Gum Arabic" \
			--labels "Ultramarine + Gum Tragacanth" \
			--labels "Ultramarine + Carrageenan" \
			--labels "Ultramarine + Dextrin Mucilage + Glycerol" \
			--labels "Ultramarine + Glucose + Sodium Carbonate" \
			--labels "Commercial Product. Square Of Reckitt’s Crown Blue" \
			--labels "Commercial Product. Square Of Reckitt And Coleman"

# Comparison of Indigo, Prussian Blue, and 'Litchfield Blue'
plot3:
	python plot.py \
		--in-data-csv combined.csv \
		--out-file comparison-of-indigo-prussian-blue-litchfield-blue \
		--out-dir plots \
		--title "Comparison of Indigo, Prussian Blue, and 'Litchfield Blue'" \
			--columns indigo_reduced \
			--columns Prussianblue_Mon \
			--columns Litchfield \
			--labels "Indigo Sulfate (Soluble) + Gum Arabic" \
			--labels "Prussian Blue + Gum Arabic" \
			--labels "Prussian Blue + Indigo Sulfate (Litchfield Blue) + Gum Arabic" 


# Comparison of Blue Colorants
plot4:
	python plot.py \
		--in-data-csv combined.csv \
		--out-file comparison-of-blue-colorants \
		--out-dir plots \
		--title "Comparison of Blue Colorants" \
			--columns smalt_gum \
			--columns Ultramarine_gumarabic_Mon \
			--columns indigo_reduced \
			--columns Prussianblue_Mon \
			--labels "Smalt + Gum Arabic" \
			--labels "Ultramarine + Gum Arabic" \
			--labels "Indigo Sulfate (Soluble) + Gum Arabic" \
			--labels "Prussian Blue + Gum Arabic"


# Comparison of Commercial Product "Mrs. Stewart's" and Prussian Blue
plot5:
	python plot.py \
		--in-data-csv combined.csv \
		--out-file comparison-of-commercial-product-mrs-stewarts-prussian-blue \
		--out-dir plots \
		--title "Comparison of Commercial Product 'Mrs. Stewart's' and Prussian Blue" \
			--columns <> \
			--columns Prussianblue_Mon \
			--labels "Commercial Product. Mrs. Stewart's Patented Laundry Bluing" \
			--labels "Prussian Blue + Gum Arabic" 
	
# Indigo Samples
plot6:
	python plot.py \
		--in-data-csv combined.csv \
		--out-file indigo-samples \
		--out-dir plots \
		--title "Indigo Samples" \
			--columns <> \
			--columns indigo_reduced \
			--columns <> \
			--labels "Indigo (Insoluble) + Gum Arabic" \
			--labels "Indigo Sulfate (Soluble) + Gum Arabic" \
			--labels "Indigo (Insoluble) + Gum Arabic + Wheat Starch" 

# Ultramarine Samples
plot7:
	python plot.py \
		--in-data-csv combined.csv \
		--out-file comparison-commercial \
		--out-dir plots \
		--title "Comparison of Two Commercial Bluing Products" \
			--columns Reckittscrownblue_Mon \
			--columns Reckittandcolemansquareblue_Mon \
			--labels "Square Of Reckitt’s Crown Blue" \
			--labels "Square Of Reckitt And Coleman"
