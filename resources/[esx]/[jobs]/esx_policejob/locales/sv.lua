Locales['sv'] = {
  -- Cloakroom
  ['cloakroom'] = 'omklädningsrum',
  ['citizen_wear'] = 'civila kläder',
  ['police_wear'] = 'polisuniform',
  ['gilet_wear'] = 'reflektiv väst',
  ['bullet_wear'] = 'skottsäker väst',
  ['no_outfit'] = 'det finns ingen uniform som passar dig!',
  ['open_cloackroom'] = 'tryck ~INPUT_CONTEXT~ för att välja ~y~kläder~s~.',
  -- Armory
  ['remove_object'] = 'ta ut objekt',
  ['deposit_object'] = 'lägg in objekt',
  ['get_weapon'] = 'ta ut vapen',
  ['put_weapon'] = 'lägg in vapen',
  ['buy_weapons'] = 'köp vapen',
  ['armory'] = 'vapenförråd',
  ['open_armory'] = 'tryck ~INPUT_CONTEXT~ för att komma åt ~y~vapenförrådet~s~.',
  ['armory_owned'] = 'ägd',
  ['armory_free'] = 'gratis',
  ['armory_item'] = '%s SEK',
  ['armory_weapontitle'] = 'vapenförråd - Köp vapen',
  ['armory_componenttitle'] = 'vapenförråd - Vapen tillbehör',
  ['armory_bought'] = 'du köpte ~y~%s~s~ för ~g~%s SEK~s~',
  ['armory_money'] = 'du har inte råd med det vapnet',
  ['armory_hascomponent'] = 'du har redan det tillbehöret!',
  ['get_weapon_menu'] = 'vapenförråd - Ta ut vapen',
  ['put_weapon_menu'] = 'vapenförråd - Spara vapen',
  -- Vehicles
  ['vehicle_menu'] = 'fordon',
  ['vehicle_blocked'] = 'det finns ingen tillgänglig plats att ställa ut fordonet på!',
  ['garage_prompt'] = 'tryck ~INPUT_CONTEXT~ för att komma åt ~y~garaget~s~.',
  ['garage_title'] = 'garage',
  ['garage_stored'] = 'inställt',
  ['garage_notstored'] = 'uttaget',
  ['garage_storing'] = 'vi håller på att ställa in ditt fordon, se till att ingen är i närheten.',
  ['garage_has_stored'] = 'fordonet har ställts in i garaget',
  ['garage_has_notstored'] = 'inget ägt fordon finns i närheten',
  ['garage_notavailable'] = 'ditt fordon är inte inställt i ditt garage.',
  ['garage_blocked'] = 'det finns ingen tillgänglig plats att ställa ut fordonet på!',
  ['garage_empty'] = 'du har inga fordon i ditt garage.',
  ['garage_released'] = 'ditt fordon har tagits ut från garaget.',
  ['garage_store_nearby'] = 'det finns inget fordon i närheten.',
  ['garage_storeditem'] = 'öppna garage',
  ['garage_storeitem'] = 'ställ in fordon',
  ['garage_buyitem'] = 'fordonshandel',
  ['garage_notauthorized'] = 'du har inte tillgång till att köpa dessa fordon.',
  ['helicopter_prompt'] = 'tryck ~INPUT_CONTEXT~ för att komma åt ~y~helikoptergaraget~s~.',
  ['shop_item'] = '%s SEK',
  ['vehicleshop_title'] = 'fordonshandel',
  ['vehicleshop_confirm'] = 'vill du köpa detta fordon?',
  ['vehicleshop_bought'] = 'du köpte ~y~%s~s~ för ~g~%s SEK~s~',
  ['vehicleshop_money'] = 'du har inte råd med detta fordon',
  ['vehicleshop_awaiting_model'] = 'fordonet ~g~LADDAS NED OCH LADDAS IN~s~ var god vänta',
  ['confirm_no'] = 'nej',
  ['confirm_yes'] = 'ja',
  -- Service
  ['service_max'] = 'du kan inte gå tjänst, poliser i tjänst: %s/%s',
  ['service_not'] = 'du är inte i tjänst! Byt om för att gå in i tjänst.',
  ['service_anonunce'] = 'tjänsteinformation',
  ['service_in'] = 'du deltog i tjänst, välkommen!',
  ['service_in_announce'] = 'operatör ~y~%s~s~ har deltagit tjänst!',
  ['service_out'] = 'du har lämnat tjänst.',
  ['service_out_announce'] = 'operatör ~y~%s~s~ har lämnat deras tjänst.',
  -- Action Menu
  ['citizen_interaction'] = 'handlingar mot civila',
  ['vehicle_interaction'] = 'handlingar på bilar',
  ['object_spawner'] = 'ta fram ett objekt',

  ['id_card'] = 'ID-Kort',
  ['search'] = 'sök igenom',
  ['handcuff'] = 'handbojor',
  ['drag'] = 'dra',
  ['put_in_vehicle'] = 'sätt in i fordon',
  ['out_the_vehicle'] = 'dra ut ur fordon',
  ['fine'] = 'Ge böter',
  ['unpaid_bills'] = 'se obetalda räkningar',
  ['license_check'] = 'se licenser',
  ['license_revoke'] = 'återkalla licenser',
  ['license_revoked'] = 'ditt ~b~%s~s~ har blivit ~y~återkallat~s~!',
  ['licence_you_revoked'] = 'du återkallade ett ~b~%s~s~ som tillhörde ~y~%s~s~',
  ['no_players_nearby'] = 'det finns ingen i närheten',
  ['being_searched'] = 'du blir ~y~visiterad~s~ av ~b~Polisen~s~',
  -- Vehicle interaction
  ['vehicle_info'] = 'fordon',
  ['pick_lock'] = 'bryt upp fordon',
  ['vehicle_unlocked'] = 'fordonet har ~g~låsts upp~s~',
  ['no_vehicles_nearby'] = 'inga fordon i närheten',
  ['impound'] = 'bärga fordonet',
  ['impound_prompt'] = 'tryck ~INPUT_CONTEXT~ för att avbryta ~y~bärgningen~s~',
  ['impound_canceled'] = 'du avbröt bärgningen',
  ['impound_canceled_moved'] = 'bärgningen avbröts på grund av att fordonet har rört sig',
  ['impound_successful'] = 'du har bärgat fordonet',
  ['search_database'] = 'fordonsuppgifter',
  ['search_database_title'] = 'fordonsuppgifter - sök med registreringsnummer',
  ['search_database_error_invalid'] = 'det är ~r~inte~s~ ett ~y~giltigt~s~ registreringsnummer',
  -- Traffic interaction
  ['traffic_interaction'] = 'trafiksåtgärder',
  ['cone'] = 'kon',
  ['barrier'] = 'barriär',
  ['spikestrips'] = 'spikmatta',
  ['box'] = 'låda',
  ['cash'] = 'låda med pengar',
  -- ID Card Menu
  ['name'] = 'namn: %s',
  ['job'] = 'jobb: %s',
  ['sex'] = 'kön: %s',
  ['dob'] = 'födelsedatum: %s',
  ['height'] = 'längd: %s',
  ['bac'] = 'alkohol i blodet: %s',
  ['unknown'] = 'okänt',
  ['male'] = 'man',
  ['female'] = 'kvinna',
  -- Body Search Menu
  ['guns_label'] = '--- Vapen ---',
  ['inventory_label'] = '--- Inventory ---',
  ['license_label'] = ' --- Licenser ---',
  ['confiscate'] = 'beslagta %s',
  ['confiscate_weapon'] = 'beslagta %s med %s skott',
  ['confiscate_inv'] = 'beslagta %sx %s',
  ['confiscate_dirty'] = 'beslagta svarta pengar: <span style="color:red;">%s SEK</span>',
  ['you_confiscated'] = 'du beslagtog ~y~%sx~s~ ~b~%s~s~ från ~b~%s~s~',
  ['got_confiscated'] = '~y~%sx~s~ ~b~%s~s~ beslagtogs av ~y~%s~s~',
  ['you_confiscated_account'] = 'du beslagtog ~g~%s SEK~s~ (%s) från ~b~%s~s~',
  ['got_confiscated_account'] = '~g~%s SEK~s~ (%s) beslagtogs av ~y~%s~s~',
  ['you_confiscated_weapon'] = 'du beslagtog ~b~%s~s~ från ~b~%s~s~ med ~o~%s~s~ skott',
  ['got_confiscated_weapon'] = 'din ~b~%s~s~ med ~o~%s~s~ skott beslagtogs av ~y~%s~s~',
  ['traffic_offense'] = 'brott mot trafikregler',
  ['minor_offense'] = 'mindre lagbrott',
  ['average_offense'] = 'medel lagbrott',
  ['major_offense'] = 'grovt lagbrott',
  ['fine_total'] = 'böter: %s',
  -- Vehicle Info Menu
  ['plate'] = 'reg nummer: %s',
  ['owner_unknown'] = 'ägare: Okänt',
  ['owner'] = 'ägare: %s',
  -- Boss Menu
  ['open_bossmenu'] = 'tryck ~INPUT_CONTEXT~ för att öppna menyn',
  ['quantity_invalid'] = 'otillgängligt antal',
  ['have_withdrawn'] = 'du har tagit ut ~y~x%s~s~ ~b~%s~s~',
  ['have_deposited'] = 'du har lagrat ~y~x%s~s~ ~b~%s~s~',
  ['quantity'] = 'antal',
  ['inventory'] = 'förråd',
  ['police_stock'] = 'polisförråd',
  -- Misc
  ['remove_prop'] = 'tryck ~INPUT_CONTEXT~ för att ta bort objektet',
  ['map_blip'] = 'polisstation',
  ['unrestrained_timer'] = 'dina handklovar har försvunnit',
  -- Notifications
  ['alert_police'] = 'meddela polisen',
  ['phone_police'] = 'polisen',
}
