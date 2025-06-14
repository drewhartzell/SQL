# Etsy #

SET SQL_SAFE_UPDATES = 0;
UPDATE etsy4
SET Item_Category =
    CASE
        WHEN Item_Name LIKE '% salt %' OR Item_Name LIKE '% pepper %' THEN 'Salt and Pepper Shakers'
        WHEN Item_Name LIKE '% lamp %' OR Item_Name LIKE '% lamps %' OR Item_Name LIKE '% lighting %'THEN 'Lamps'
	WHEN Item_Name LIKE '% book %' OR Item_Name LIKE '% books %'OR Item_Name LIKE '% essays %' OR Item_Name LIKE '% hardcover %'OR Item_Name LIKE '% volume %' OR Item_Name LIKE '% novel %' OR Item_Name LIKE '% bible %' THEN 'Books/Bibles'
        WHEN Item_Name LIKE '% bowl %' OR Item_Name LIKE '% bowls %' THEN 'Bowls'
	WHEN Item_Name LIKE '% afghan %' OR Item_Name LIKE '% afghans %' OR Item_Name LIKE '% blanket %'OR Item_Name LIKE '% blankets %' THEN 'Afghans/Blankets'
        WHEN Item_Name LIKE '% quilt %' OR Item_Name LIKE '% quilts %' THEN 'Quilts'
        WHEN Item_Name LIKE '% magazine %' OR Item_Name LIKE '% magazines %'OR Item_Name LIKE '% newspapers %'OR Item_Name LIKE '% newspaper %' THEN 'Magazines/Newspapers'
        WHEN Item_Name LIKE '% shirt %' OR Item_Name LIKE '% dress %' OR Item_Name LIKE '% clothing %' OR Item_Name LIKE '% pants %' THEN 'Apparel'
        WHEN Item_Name LIKE '% art%' OR Item_Name LIKE '% print %' OR Item_Name LIKE '% photo %' OR Item_Name LIKE '% picture %' THEN 'Art'
        WHEN Item_Name LIKE '% paperweight%' OR Item_Name LIKE '% paperweights%' THEN 'Paperweights'
	WHEN Item_Name LIKE '% christmas %' OR Item_Name LIKE '% santa %' OR Item_Name LIKE '% angel %' THEN 'Christmas'
        WHEN Item_Name LIKE '% flag %' OR Item_Name LIKE '% flags %' THEN 'Flags'
        WHEN Item_Name LIKE '% curtain %' OR Item_Name LIKE '% curtains %' THEN 'Curtains'
        WHEN Item_Name LIKE '% plate %'  OR Item_Name LIKE '% plates %' OR Item_Name LIKE '% platters %' OR Item_Name LIKE '% tray %' OR Item_Name LIKE '% platter %' THEN 'Plates/Platters/Trays'
        WHEN Item_Name LIKE '% accessories %' OR Item_Name LIKE '% pin %' OR Item_Name LIKE '% pins %' OR Item_Name LIKE '% bracelet %' OR Item_Name LIKE '% brush %' OR Item_Name LIKE '% belt %' OR Item_Name LIKE '% purse %' THEN 'Accessories'
        WHEN Item_Name LIKE '% bedspread %' OR Item_Name LIKE '% linen %' OR Item_Name LIKE '% tablecloth %' OR Item_Name LIKE '% doilies %' THEN 'Textiles/Linens'
        WHEN Item_Name LIKE '% figurine %' OR Item_Name LIKE '% doulton %' OR Item_Name LIKE '% statue %' OR Item_Name LIKE '% doll %'THEN 'Figurines/Dolls'
        WHEN Item_Name LIKE '% dish %'  THEN 'Dishes'
        WHEN Item_Name LIKE '% vase %' OR Item_Name LIKE '% jar %' THEN 'Vases/Jars'
        WHEN Item_Name LIKE '% pot %' OR Item_Name LIKE '% pitcher %' THEN 'Pots/Pitchers'
	WHEN Item_Name LIKE '% bear %'  THEN 'Bears'
        WHEN Item_Name LIKE '% planter %'  THEN 'Planters'
        WHEN Item_Name LIKE '% basket %'  THEN 'Basket'
        WHEN Item_Name LIKE '% clock %'  THEN 'Clocks'
        WHEN Item_Name LIKE '% plaque %'  THEN 'Plaques'
        WHEN Item_Name LIKE '% bin %' OR Item_Name LIKE '% container %' OR Item_Name LIKE '% tin %' THEN 'Bins/Containers'
        WHEN Item_Name LIKE '% collectible %' OR Item_Name LIKE '% model %' THEN 'Collectibles/Models'
        WHEN Item_Name LIKE '% record %' OR Item_Name LIKE '% records %'OR Item_Name LIKE '% CDs %' OR Item_Name LIKE '% reels %' THEN 'Records/CDs'
        WHEN Item_Name LIKE '% necklace %' OR Item_Name LIKE '% earring %' OR Item_Name LIKE '% brooch %' THEN 'Jewelry'
        WHEN Item_Name LIKE '% cup %' OR Item_Name LIKE '% mug %' OR Item_Name LIKE '% mugs %'OR Item_Name LIKE '% cups %'THEN 'Cups/Mugs'
        WHEN Item_Name LIKE '% bottle %' OR Item_Name LIKE '% flask %' THEN 'Bottles/Flasks'
        WHEN Item_Name LIKE '% fabric %'  THEN 'Fabric'
        WHEN Item_Name LIKE '% globe %'  THEN 'Globes'
        WHEN Item_Name LIKE '% mirror %'  THEN 'Mirrors'
        WHEN Item_Name LIKE '% bowl %'  OR Item_Name LIKE '% bowls %' THEN 'Bowls'
        WHEN Item_Name LIKE '% china %'  THEN 'China'
	WHEN Item_Name LIKE '% toy %' OR Item_Name LIKE '% game %' OR Item_Name LIKE '% puppet %' OR Item_Name LIKE '% stuffed %' THEN 'Games/Toys/Stuffed Animals'
	WHEN Item_Name LIKE '% kitchen %' OR Item_Name LIKE '% cutlery %' THEN 'Kitchen Items'
        WHEN Item_Name LIKE '% holder %' OR Item_Name LIKE '% candle %' THEN 'Candles/Candle Holders'
        WHEN Item_Name LIKE '% sewing box %' OR Item_Name LIKE '% sewing %' THEN 'Sewing Box/Sewing Supplies'
        WHEN Item_Name LIKE '% box%'  THEN 'Jewelry Box/Music Boxes'
        WHEN Item_Name LIKE '% tree%'  THEN 'Golden Trees'
        WHEN Item_Name LIKE '% glass %' OR Item_Name LIKE '% glasses %' OR Item_Name LIKE '% fenton %' OR Item_Name LIKE '% crystal %' THEN 'Glass'
        WHEN Item_Name LIKE '% decor %' OR Item_Name LIKE '% decor' OR Item_Name LIKE '% bookend %' THEN 'Decor'
        WHEN Item_Name LIKE '% brass%'  THEN 'Brass'
        WHEN Item_Name LIKE '% pottery %' THEN 'Pottery'
        WHEN Item_Name LIKE '% porcelain %' THEN 'Porcelain'
        
        ELSE 'Other'
    END;

//
//

UPDATE etsy4
SET Item_Category =
    CASE
        WHEN Item_Name LIKE '%lamp%' THEN 'Lamps'
        WHEN Item_Name LIKE '%book%' THEN 'Books'
        WHEN Item_Name LIKE '%quilt%' THEN 'Quilts'
        WHEN Item_Name LIKE '%shirt%' THEN 'Apparel'
	WHEN Item_Name LIKE '%glass%' THEN 'Glass'
	WHEN Item_Name LIKE '%brass%' THEN 'Brass'
	WHEN Item_Name LIKE '%figurines%' THEN 'Figurines'
	WHEN Item_Name LIKE '%afghan%' OR Item_Name LIKE '%blanket%'THEN 'Afghans/Blankets'
	WHEN Item_Name LIKE '%plate%' OR Item_Name LIKE '%platter%'THEN 'Plates/Platters'
        WHEN Item_Name LIKE '%pottery%' THEN 'Pottery'
        WHEN Item_Name LIKE '%vase%' THEN 'Vase'
        WHEN Item_Name LIKE '%dish%' THEN 'Dish'
        WHEN Item_Name LIKE '%decor%' THEN 'Decor'
        WHEN Item_Name LIKE '%bear%' THEN 'Bear'
        WHEN Item_Name LIKE '%record%' THEN 'Record'
	WHEN Item_Name LIKE '%christmas%' THEN 'Christmas'
        WHEN Item_Name LIKE '%flag%' THEN 'Flag'
	WHEN Item_Name LIKE '%art%' THEN 'Art'
        ELSE 'Other'
    END;
