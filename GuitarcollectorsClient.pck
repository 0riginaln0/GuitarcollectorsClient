GDPC                 �                                                                      #   X   res://.godot/exported/133200997/export-044d6f760e8ea50029a8585d9d7fa607-ExpenseItems.scn 3      U      ����`�(.]lm�%.�    X   res://.godot/exported/133200997/export-048b7b24a4bd58c7d827bb52577412f7-custom_theme.res@      �      GVEJ������Q��    `   res://.godot/exported/133200997/export-0d543ea52c425910f8ce7492bc358e6c-AuthenticationWindow.scnP      �      L7H�P���˓3���    X   res://.godot/exported/133200997/export-1155e1cbb106903d5efb658c231616d8-StartWindow.scn ��      :      �4ٗ�A���h߫	n�    \   res://.godot/exported/133200997/export-44da4095f26c9f3aa4facce279a123fc-RequestPerformer.scnЛ            �����`�G+N�n�    T   res://.godot/exported/133200997/export-79e710c743a3b34d96cf94ee83511ef9-charges.scn �            ��Q&�:B:�pF��    X   res://.godot/exported/133200997/export-80c2c932599770d41837c2a6163792d4-Warehouse.scn   �r      &      J����Ty/�਀J    T   res://.godot/exported/133200997/export-8e444d32ebeacd603bcc73eb2bfd9a8c-Sales.scn   �P      �      ���8���F���z     \   res://.godot/exported/133200997/export-e51e027221664907aa8599e643b208b6-ChooseCategory.scn  p�      ;      h�,ؾ���Ɏ�M@F��    ,   res://.godot/global_script_class_cache.cfg                 ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex��      ^      2��r3��MgB�[79       res://.godot/uid_cache.bin  �      �      )�8�0fa�#��\j���    <   res://Scenes/AuthenticationWindow/AuthenticationWindow.gd           &      l-h㳺>���Z�    D   res://Scenes/AuthenticationWindow/AuthenticationWindow.tscn.remap   ��      q       [
%�� ��6f�ǈ    0   res://Scenes/AuthenticationWindow/EmailFocus.gd       �       ��k�u�!�|R���    <   res://Scenes/AuthenticationWindow/custom_theme.tres.remap   @�      i       Ϟ����m��Q���    8   res://Scenes/RequestsWindow/Categories/ExpenseItems.gd  �*      G      j*��f)��[A~F    @   res://Scenes/RequestsWindow/Categories/ExpenseItems.tscn.remap   �      i       �Sb+9fI|��G    0   res://Scenes/RequestsWindow/Categories/Sales.gd `D            Q?#X��!1�,��    8   res://Scenes/RequestsWindow/Categories/Sales.tscn.remap ��      b       ��W��.��o���C�    4   res://Scenes/RequestsWindow/Categories/Warehouse.gd �d      '      ��,�<�4�]��]Ct    <   res://Scenes/RequestsWindow/Categories/Warehouse.tscn.remap  �      f       ��$*T��X"��t��    4   res://Scenes/RequestsWindow/Categories/charges.gd   �      �      Up
��`-�^��p�    <   res://Scenes/RequestsWindow/Categories/charges.tscn.remap   ��      d       me8��?�2��Tx     0   res://Scenes/RequestsWindow/ChooseCategory.gd   ��      �      ��{�"�N�W ���    8   res://Scenes/RequestsWindow/ChooseCategory.tscn.remap   p�      k       ,o�{S�W��El�?    0   res://Scenes/RequestsWindow/RequestPerformer.gd ��             ^}d.�2`���>['��    8   res://Scenes/RequestsWindow/RequestPerformer.tscn.remap �      m       ���M�}UabvHh�
    (   res://Scenes/StartWindow/StartWindow.gd ��      �      $_���':�R��Je)W    0   res://Scenes/StartWindow/StartWindow.tscn.remap P�      h       �e�>ѯ�V3�:�[D�       res://icon.svg  ��      N      ]��s�9^w/�����       res://icon.svg.import    �      �       ~��0���]Ҕ;L       res://project.binary��      �      ��N�3����OCE       res://src/JWT.gdШ      �       ���
bʈN�QW2�T1       res://src/Response.gd   ��      �       Wi[MkW��5�4�=<v.    list=Array[Dictionary]([])
rpB��extends Control

func _on_log_in_button_up() -> void:
	# Составляем dictionary (словарь) email, password
	var data_to_send = {
		"email": $MarginContainer/VBoxContainer/email.text,
		"password": $MarginContainer/VBoxContainer/password.text
	}
	# url по которому будет выполняться request
	var url := "http://localhost:8080/api/auth/authenticate"
	# Делаем json из словаря
	var json = JSON.stringify(data_to_send, "\t")
	# Подготавливаем заголовок
	var headers = ["Content-Type: application/json"]
	# Отправляем request
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, json)


func _on_http_request_request_completed(_result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code != 200:
		print("Вы что-то не так ввели, попробуйте ещё раз")
		return
	# Достаём body в виде json
	var json = body.get_string_from_utf8()
	# Парсим его в dictionary
	var parsed_data = JSON.parse_string(json)
	# Кладём полученный токен в память
	Jwt.set_token(str(parsed_data.token))
	print(str(parsed_data.token))
	# Переходим на сцену выбора категорий (Склад, Продажи, Расходы, Статьи расходов)
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/ChooseCategory.tscn")


func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/StartWindow/StartWindow.tscn")
@�\]�9RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script :   res://Scenes/AuthenticationWindow/AuthenticationWindow.gd ��������   Theme 4   res://Scenes/AuthenticationWindow/custom_theme.tres !+��_   Script 0   res://Scenes/AuthenticationWindow/EmailFocus.gd ��������      local://PackedScene_asqxu �         PackedScene          	         names "          AuthenticationWindow    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    MarginContainer    offset_left    offset_top    offset_right    offset_bottom    VBoxContainer    email    theme $   theme_override_font_sizes/font_size    text    expand_to_text_length    caret_blink 	   LineEdit 	   password    Log in    Button    Back    HTTPRequest    _on_log_in_button_up 
   button_up    _on_back_button_up #   _on_http_request_request_completed    request_completed    	   variants                        �?                      C     (C    ��C    ��C            @         gooddmitriy@mail.ru                      1234       Log in       <       node_count             nodes     v   ��������       ����                                                          	   	   ����         
                                         ����                          ����            	      
                                            ����            	      
                                ����            
                          ����            
                           ����              conn_count             conns                                                                                      node_paths              editable_instances              version             RSRCRSRC                     Theme            ��������                                                  resource_local_to_scene    resource_name    font_names    font_italic    font_weight    font_stretch    antialiasing    generate_mipmaps    allow_system_fallback    force_autohinter    hinting    subpixel_positioning #   multichannel_signed_distance_field    msdf_pixel_range 
   msdf_size    oversampling 
   fallbacks    script    content_margin_left    content_margin_top    content_margin_right    content_margin_bottom    default_base_scale    default_font    default_font_size    LineEdit/styles/focus    LineEdit/styles/normal    LineEdit/styles/read_only           local://SystemFont_rg42m *         local://StyleBoxEmpty_1bqyl E         local://Theme_5no6p c         SystemFont             StyleBoxEmpty             Theme                                                                RSRC�\�Sk������extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Забирает фокус на себя
	grab_focus()
��ˑm�ê�extends Control

func _on_show_all_charges_button_up() -> void:
	var url = ("http://localhost:8080/api/charges/")
	$Request.get_request(url)


func _on_show_charge_by_id_button_up() -> void:
	var url = ("http://localhost:8080/api/charges/" + $TabContainer/GET/ChargeId.text)
	$Request.get_request(url)


func _on_add_charge_button_up() -> void:
	var url = "http://localhost:8080/api/charges/"
	var json = {
		"amount": $TabContainer/POST/Amount.text,
		"expenseItem": {
			"id": $TabContainer/POST/ExpenseItemId.text
		}
	}
	$Request.post_request(url, str(json))


func _on_update_charge_button_up() -> void:
	var url = "http://localhost:8080/api/charges/" + $TabContainer/PUT/ChargeId.text
	var json = {
		"amount": $TabContainer/PUT/Amount.text,
		"expenseItem": {
			"id": $TabContainer/PUT/ExpenseItemId.text
		}
	}
	$Request.put_request(url, str(json))


func _on_delete_charge_button_up() -> void:
	var url = "http://localhost:8080/api/charges/" + $TabContainer/DELETE/ChargeId.text
	$Request.delete_request(url)


func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/ChooseCategory.tscn")


func _on_request_response_ready() -> void:
	$RichTextLabel.text = format_json(Response.get_response())

func format_json(json_string: String) -> String:
	var formatted_string: String = ""
	var indent_level: int = 0
	var in_quotes: bool = false
	
	for i in range(json_string.length()):
		var ch: String = json_string.substr(i, 1)
		if ch == '"' and json_string.substr(i - 1, 1) != '\\':
			in_quotes = not in_quotes
		if not in_quotes:
			if ch == '{' or ch == "[":
				formatted_string += ch + '\n' + '\t'.repeat(indent_level + 1)
				indent_level += 1
			elif ch == '}' or ch ==']':
				indent_level -= 1
				formatted_string += '\n' + '\t'.repeat(indent_level) + ch
			elif ch == ',':
				formatted_string += ',' + '\n' + '\t'.repeat(indent_level)
			else:
				formatted_string += ch
		else :
			formatted_string += ch
	return formatted_string
�q�HR5ߋY��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script 2   res://Scenes/RequestsWindow/Categories/charges.gd ��������   PackedScene 2   res://Scenes/RequestsWindow/RequestPerformer.tscn 4p%�s��d      local://PackedScene_56q0s w         PackedScene          	         names "   .      Charges    layout_mode    anchors_preset    offset_right    offset_bottom    script    Control    TabContainer $   theme_override_font_sizes/font_size    GET    visible    TabBar    ScrollContainer    VBoxContainer    ShowAllCharges    text    Button    ShowChargeById 	   ChargeId    offset_left    offset_top    placeholder_text 	   LineEdit    POST 
   AddCharge    Amount    expand_to_text_length    ExpenseItemId    PUT    UpdateCharge    DELETE    DeleteCharge    RichTextLabel +   theme_override_font_sizes/normal_font_size    scroll_following    Back    Request    _on_show_all_charges_button_up 
   button_up     _on_show_charge_by_id_button_up    _on_add_charge_button_up    _on_update_charge_button_up    _on_delete_charge_button_up    _on_back_button_up    _on_request_response_ready    response_ready    	   variants    :                      B               0D     4D   2                            D    �D      Show all charges       Show charge by ID      �C     �B   ��C     �B      id:       A     �B      Add charge      C    �D     =C      amount:            �C     `C    �0D    ��C      Expense item id:      2D      Update charge      0C     D     eC      Amount:      hC     D    ��C     �B    @D     -C      Charge id:       Delete charge      �C     �B     D     C     �D           �D     �D     .D   @         <                node_count             nodes     �  ��������       ����                                                    ����                                         	   ����   
               	                    ����            
                          ����                          ����            	                          ����            	                          ����                                    	                          ����   
               	                    ����                        
             	             ����             
             ����            	                          ����                                    	                                ����                                    	                                ����   
               	                    ����                        
                           ����                          ����            	      !                    ����                  "      #      $      	      %                          ����                  &      '      (      	                                ����                  )      *      +      	      ,                          ����   
               	                    ����                        
                           ����                          ����            	      -                    ����            .      /      0      1      	      ,                             ����                  2         !   3   "                     #   ����            4      0      5      6      7      8               ���$   9                 conn_count             conns     1          &   %                     &   '                     &   (                     &   )                     &   *                     &   +                     -   ,                    node_paths              editable_instances              version             RSRC��]��!���extends Control

func _on_all_expense_items_button_up() -> void:
	var url = ("http://localhost:8080/api/expense-items/")
	$RequestPerformer.get_request(url)

func _on_expense_item_by_id_button_up() -> void:
	var url = ("http://localhost:8080/api/expense-items/" + $TabContainer/GET/IDInput.text)
	$RequestPerformer.get_request(url)

func _on_charges_by_expense_item_id_button_up() -> void:
	var url = ("http://localhost:8080/api/expense-items/charges/" + $TabContainer/GET/IDInput.text)
	$RequestPerformer.get_request(url)


func _on_add_expense_item_button_up() -> void:
	var url = "http://localhost:8080/api/expense-items/"
	var json = {
		"name": $TabContainer/POST/Name.text
	}
	$RequestPerformer.post_request(url, str(json))
	
func _on_update_expense_item_button_up() -> void:
	var url = "http://localhost:8080/api/expense-items/" + $TabContainer/PUT/ID.text
	var json = {
		"name": $TabContainer/PUT/Name.text
	}
	$RequestPerformer.put_request(url, str(json))

func _on_delete_expense_item_button_up() -> void:
	var url = "http://localhost:8080/api/expense-items/" + $TabContainer/DELETE/ID.text
	$RequestPerformer.delete_request(url)

func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/ChooseCategory.tscn")


func _on_request_performer_response_ready() -> void:
	$RichTextLabel.text = format_json(Response.get_response())

func format_json(json_string: String) -> String:
	var formatted_string: String = ""
	var indent_level: int = 0
	var in_quotes: bool = false
	
	for i in range(json_string.length()):
		var ch: String = json_string.substr(i, 1)
		if ch == '"' and json_string.substr(i - 1, 1) != '\\':
			in_quotes = not in_quotes
		if not in_quotes:
			if ch == '{' or ch == "[":
				formatted_string += ch + '\n' + '\t'.repeat(indent_level + 1)
				indent_level += 1
			elif ch == '}' or ch ==']':
				indent_level -= 1
				formatted_string += '\n' + '\t'.repeat(indent_level) + ch
			elif ch == ',':
				formatted_string += ',' + '\n' + '\t'.repeat(indent_level)
			else:
				formatted_string += ch
		else :
			formatted_string += ch
	return formatted_string
�3֛�&q�)RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script 7   res://Scenes/RequestsWindow/Categories/ExpenseItems.gd ��������   Script 0   res://Scenes/RequestsWindow/RequestPerformer.gd ��������      local://PackedScene_hnro1 u         PackedScene          	         names "   ;      ExpenseItems    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    TabContainer    offset_right    offset_bottom $   theme_override_font_sizes/font_size    GET    visible    TabBar    ScrollContainer    VBoxContainer    All expense items    text    Button    Expense item by id    Charges by expense item id    IDInput    offset_left    offset_top    placeholder_text 	   LineEdit    POST    Add expense item    Name    expand_to_text_length    PUT    Update expense item    ID    DELETE    Delete expense item    RichTextLabel +   theme_override_font_sizes/normal_font_size    scroll_following    Back    RequestPerformer    Node    HTTPRequest    _on_get_tab_clicked    tab_clicked     _on_all_expense_items_button_up 
   button_up !   _on_expense_item_by_id_button_up )   _on_charges_by_expense_item_id_button_up    _on_post_tab_clicked    _on_add_expense_item_button_up "   _on_update_expense_item_button_up "   _on_delete_expense_item_button_up    _on_back_button_up %   _on_request_performer_response_ready    response_ready #   _on_http_request_request_completed    request_completed    	   variants    8                    �?                             D     4D   4              �D             All expense items       Expense item by id
       Charges by expense item id      �C     �B     D     0C      id:       A     �B     �C     0D      Expense item      �C     �B    �D     C      name:            �B     D     2D      Update expense item      �C     @C     D     uC     �C    ��C     �B     D      Delete expense item      �C     C     �D            text      �D     D    ��D     *D   @         <                node_count             nodes     �  ��������       ����                                                          	   	   ����         
                                   ����      	                          ����         
         
                    ����                          ����                                      ����                                      ����                                      ����                     
                                         ����      	             	             ����                     
                
             ����                          ����                         	             ����                     
                                                ����      	                          ����               
          !                    ����                       !   ����                  "                 "   ����            #      $   
   %      &                                ����                  '   
         (                             #   ����      	                          ����            )   
         *                    ����                       $   ����                  +                 "   ����            ,      )   
          -                           %   %   ����               
   .         &   /      0   '                     (   ����            1      2   
   3      4      5      6               *   )   ����      7              +   +   ����              conn_count             conns     M          -   ,                     /   .                     /   0                     /   1              	       -   2                     /   3                     /   4                     /   5                     /   6                     8   7                    :   9                    node_paths              editable_instances              version             RSRCr<�i\��@�lextends Control


func _on_sales_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/")
	$Request.get_request(url)


func _on_sales_by_id_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/" + $TabContainer/GET/SaleId.text)
	$Request.get_request(url)


func _on_add_sale_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/")
	var json = {
		"quantity": $TabContainer/POST/Quantity.text,
		"warehouse": {
			"id": $TabContainer/POST/ProductId.text
		}
	}
	$Request.post_request(url, str(json))


func _on_add_sale_percentage_discount_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/percentage-discount/" + $TabContainer/POST/PercentageDiscount.text)
	var json = {
		"quantity": $TabContainer/POST/Quantity.text,
		"warehouse": {
			"id": $TabContainer/POST/ProductId.text
		}
	}
	$Request.post_request(url, str(json))


func _on_add_sale_absolute_discount_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/absolute-discount/" + $TabContainer/POST/AbsoluteDiscount.text)
	var json = {
		"quantity": $TabContainer/POST/Quantity.text,
		"warehouse": {
			"id": $TabContainer/POST/ProductId.text
		}
	}
	$Request.post_request(url, str(json))


func _on_update_sale_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/" + $TabContainer/PUT/SaleId.text)
	var json = {
		"quantity": $TabContainer/PUT/Quantity.text,
		"warehouse": {
			"id": $TabContainer/PUT/ProductId.text
		}
	}
	$Request.put_request(url, str(json))


func _on_give_persentage_discount_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/" + $TabContainer/PUT/SaleId.text + "/percentage-discount/" + $TabContainer/PUT/PercentageDiscount.text)
	$Request.put_request(url)


func _on_give_absolute_discount_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/" + $TabContainer/PUT/SaleId.text + "/absolute-discount/" + $TabContainer/PUT/AbsoluteDiscount.text)
	$Request.put_request(url)


func _on_delete_sale_button_up() -> void:
	var url = ("http://localhost:8080/api/sales/" + $TabContainer/DELETE/SaleId.text)
	$Request.delete_request(url)


func _on_button_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/ChooseCategory.tscn")


func _on_request_response_ready() -> void:
	$RichTextLabel.text = format_json(Response.get_response())

func format_json(json_string: String) -> String:
	var formatted_string: String = ""
	var indent_level: int = 0
	var in_quotes: bool = false
	
	for i in range(json_string.length()):
		var ch: String = json_string.substr(i, 1)
		if ch == '"' and json_string.substr(i - 1, 1) != '\\':
			in_quotes = not in_quotes
		if not in_quotes:
			if ch == '{' or ch == "[":
				formatted_string += ch + '\n' + '\t'.repeat(indent_level + 1)
				indent_level += 1
			elif ch == '}' or ch ==']':
				indent_level -= 1
				formatted_string += '\n' + '\t'.repeat(indent_level) + ch
			elif ch == ',':
				formatted_string += ',' + '\n' + '\t'.repeat(indent_level)
			else:
				formatted_string += ch
		else :
			formatted_string += ch
	return formatted_string
�O���)D��,RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script 0   res://Scenes/RequestsWindow/Categories/Sales.gd ��������   PackedScene 2   res://Scenes/RequestsWindow/RequestPerformer.tscn 4p%�s��d      local://PackedScene_1gjil u         PackedScene          	         names "   7      Sales    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    TabContainer    offset_right    offset_bottom $   theme_override_font_sizes/font_size    GET    visible    TabBar    VBoxContainer    text    Button 
   SalesById    SaleId    offset_left    offset_top    placeholder_text    expand_to_text_length 	   LineEdit    POST    AddSale    AddSalePercentageDiscount    AddSaleAbsoluteDiscount 	   Quantity 
   ProductId    AbsoluteDiscount    PercentageDiscount    PUT    UpdateSale    GivePersentageDiscount    GiveAbsoluteDiscount    DELETE    DeleteSale    RichTextLabel    Request    _on_sales_button_up 
   button_up    _on_sales_by_id_button_up    _on_add_sale_button_up +   _on_add_sale_percentage_discount_button_up )   _on_add_sale_absolute_discount_button_up    _on_update_sale_button_up '   _on_give_persentage_discount_button_up %   _on_give_absolute_discount_button_up    _on_delete_sale_button_up    _on_button_button_up    _on_request_response_ready    response_ready    	   variants    J                    �?                            0D     4D                   D    �&D      Sales       Sales by id       D     @@   �D     B      id:            `B     �C   	   Add sale       Sell with persantage discount       Sell with absolute discount      �C    �&D     �B   
   quantity:      �B    �-D     -C      product id:      �C     �C     -D    ��C      absolute discount:      �C    @D    ��C      % discount:      @B     D      Update sale       Give % discount       Give absolute discount      �C   �
D    ��C   	   sale id:      D   	   quanity:      �C    ��C     �C     �C     %D    ��C     �C     D    @D    @D      Delete sale      D   �D     �B     �D     �D    ��D     *D   @         <                node_count    !         nodes     -  ��������       ����                                                          	   	   ����         
                                   ����      	                                ����         
   
                           ����                                      ����                                      ����                     
                                               ����      	                                ����               
                             ����                                      ����                                      ����                                      ����                     
                                               ����                     
                                                 ����            !      "   
   #      $            %                       !   ����            !      &   
   '      (            )                       "   ����      	                                ����            *   
   +                       #   ����                  ,                 $   ����                  -                 %   ����                  .                    ����                  /   
   0      1            2                          ����                  &   
   3      (            4                          ����                  5   
         6                                        ����            7      8   
   9      :            %                       !   ����            ;      <   
   =      >            )                       &   ����      	                                ����               
   +                       '   ����                  ?                    ����            @         
   A      B                           (   (   ����               
   C                           ����            D      
   
   E      F      G      H               ���)   I                 conn_count             conns     M          +   *                     +   ,              	       +   -              
       +   .                     +   /                     +   0                     +   1                     +   2                     +   3                     +   4                      6   5                    node_paths              editable_instances              version             RSRC_y"C�extends Control

func _on_all_products_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/")
	$Request.get_request(url)

func _on_product_by_id_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/" + $"TabContainer/GET/Product id".text)
	$Request.get_request(url)

func _on_products_in_stock_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/instock")
	$Request.get_request(url)

func _on_quantity_of_products_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/quantity")
	$Request.get_request(url)

func _on_quantity_of_product_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/quantity/" + $"TabContainer/GET/Product id".text)
	$Request.get_request(url)

func _on_average_amount_of_all_products_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/average")
	$Request.get_request(url)

func _on_by_name_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/name/" + $TabContainer/GET/Name.text)
	$Request.get_request(url)

func _on_by_price_from_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/from/" + $TabContainer/GET/Price.text)
	$Request.get_request(url)

func _on_by_price_up_to_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/upto/" + $TabContainer/GET/Price.text)
	$Request.get_request(url)

func _on_sales_by_product_id_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/sales/" + $"TabContainer/GET/Product id".text)
	$Request.get_request(url)

func _on_add_product_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/")
	var json = {
		"name": $TabContainer/POST/Name.text,
		"quantity": $TabContainer/POST/Quantity.text,
		"amount": $TabContainer/POST/Amount.text
	}
	$Request.post_request(url, str(json))

func _on_add_repurchased_product_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/repurchase/" + $TabContainer/POST/Margin.text)
	var json = {
		"name": $TabContainer/POST/Name.text,
		"quantity": $TabContainer/POST/Quantity.text,
		"amount": $TabContainer/POST/Amount.text
	}
	$Request.post_request(url, str(json))

func _on_update_product_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/" + $"TabContainer/PUT/Product id".text)
	var json = {
		"name": $TabContainer/PUT/Name.text,
		"quantity": $TabContainer/PUT/Quantity.text,
		"amount": $TabContainer/PUT/Amount.text
	}
	$Request.put_request(url, str(json))

func _on_delete_product_button_up() -> void:
	var url = ("http://localhost:8080/api/warehouse/" + $"TabContainer/DELETE/Product id".text)
	$Request.delete_request(url)

func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/ChooseCategory.tscn")

func _on_request_response_ready() -> void:
	$RichTextLabel.text = format_json(Response.get_response())

func format_json(json_string: String) -> String:
	var formatted_string: String = ""
	var indent_level: int = 0
	var in_quotes: bool = false
	
	for i in range(json_string.length()):
		var ch: String = json_string.substr(i, 1)
		if ch == '"' and json_string.substr(i - 1, 1) != '\\':
			in_quotes = not in_quotes
		if not in_quotes:
			if ch == '{' or ch == "[":
				formatted_string += ch + '\n' + '\t'.repeat(indent_level + 1)
				indent_level += 1
			elif ch == '}' or ch ==']':
				indent_level -= 1
				formatted_string += '\n' + '\t'.repeat(indent_level) + ch
			elif ch == ',':
				formatted_string += ',' + '\n' + '\t'.repeat(indent_level)
			else:
				formatted_string += ch
		else :
			formatted_string += ch
	return formatted_string
�(�S�,/�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script 4   res://Scenes/RequestsWindow/Categories/Warehouse.gd ��������   PackedScene 2   res://Scenes/RequestsWindow/RequestPerformer.tscn 4p%�s��d      local://PackedScene_0wb5a y         PackedScene          	         names "   E   
   Warehouse    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    TabContainer    offset_right    offset_bottom $   theme_override_font_sizes/font_size    GET    visible    TabBar    ScrollContainer    VBoxContainer    All products    text    Button    Product by id    Products in stock    Quantity of products    Quantity of product    Average amount of all products    By name    By price from    By price up to    Sales by product id    Product id    offset_left    offset_top    placeholder_text    expand_to_text_length 	   LineEdit    Name    Price    POST    Add product    Add repurchased product 	   Quantity    Amount    Margin    PUT    Update product    DELETE    Delete product    RichTextLabel    Back    Request    _on_all_products_button_up 
   button_up    _on_product_by_id_button_up     _on_products_in_stock_button_up #   _on_quantity_of_products_button_up "   _on_quantity_of_product_button_up -   _on_average_amount_of_all_products_button_up    _on_by_name_button_up    _on_by_price_from_button_up    _on_by_price_up_to_button_up "   _on_sales_by_product_id_button_up    _on_add_product_button_up &   _on_add_repurchased_product_button_up    _on_update_product_button_up    _on_delete_product_button_up    _on_back_button_up    _on_request_response_ready    response_ready    	   variants    P                    �?                            0D     4D   2               D    � D   "         All products       Product by id       Products in stock       Quantity of products       Quantity of product       Average amount of all products       By name       By price from       By price up to       Sales by product id      D     @@     &D     `B             id:            lB    �'D     �B      name:      �B     (C      price:      �B      Add product       Add repurchased product       D     �B   �D     �B     C      D     EC   
   quantity:      HC     }C      amount:      �C    ��C   
   margin %:       Update product      �C     �B      product id:       C    �D     5C     8C    �D     mC     pC    @D    ��C      amount       Delete product      �C    �%D     C     �D     �D     D     �D     D   @         <                node_count    +         nodes     �  ��������       ����                                                          	   	   ����         
                                   ����      	                          ����         
   
                          ����                          ����                                      ����                                      ����                                      ����                                      ����                                      ����                                      ����                                      ����                                      ����                                      ����                                #      ����                      
                  !      "                 #   $   ����                      
                   !   !   "                 #   %   ����                   "   
         #         !   $   "                    &   ����      	                          ����             %   
   
                          ����                       '   ����                  &                 (   ����                  '              #   $   ����            (       )   
   *      +         !   !   "                 #   )   ����            (       ,   
   -      .         !   /   "                 #   *   ����            (       0   
   -      1         !   2   "                 #   +   ����            (       3   
   -      4         !   5   "                    ,   ����      	                          ����             %   
   
                          ����                       -   ����                  6              #      ����            7       %   
   
      8         !   9   "                 #   $   ����            7       :   
   ;      <         !   !   "                 #   )   ����            7       =   
   >      ?         !   /   "                 #   *   ����            7       @   
   A      B         !   C   "                    .   ����      	             #             ����             %   
   
             $             ����             %          /   ����                  D       #       #      ����            E       )   
   F      G         !   9   "                  0   0   ����               
   H                        1   ����            I       J   
   K      L      M      N               ���2   O                 conn_count             conns     p          4   3                     4   5                     4   6                     4   7              	       4   8              
       4   9                     4   :                     4   ;                     4   <                     4   =                     4   >                     4   ?                     4   @              &       4   A              )       4   B              *       D   C                    node_paths              editable_instances              version             RSRC*+��L"���4extends Control

func _on_warehouse_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/Categories/Warehouse.tscn")

func _on_sales_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/Categories/Sales.tscn")

func _on_expense_items_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/Categories/ExpenseItems.tscn")

func _on_charges_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/Categories/charges.tscn")

func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/StartWindow/StartWindow.tscn")
�e��URSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script .   res://Scenes/RequestsWindow/ChooseCategory.gd ��������      local://PackedScene_3kns0 %         PackedScene          	         names "         ChooseCategory    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    MarginContainer    offset_left    offset_top    offset_right    offset_bottom    VBoxContainer 
   Warehouse $   theme_override_font_sizes/font_size    text    Button    Sales    ExpenseItems    Charges    Back    _on_warehouse_button_up 
   button_up    _on_sales_button_up    _on_expense_items_button_up    _on_charges_button_up    _on_back_button_up    	   variants                        �?                            �C     0C    �]D     D   @      
   Warehouse       Sales       Expense items       Charges       <       node_count             nodes     p   ��������       ����                                                          	   	   ����         
                     	                    ����                          ����            
                          ����            
                          ����            
                          ����            
                          ����            
                   conn_count             conns     #                                                                                                                                 node_paths              editable_instances              version             RSRC.���extends Node

signal response_ready

func get_request(url: String):
	$HTTPRequest.request(url)
	
func post_request(url: String, json: String):
	var headers: PackedStringArray = ["Authorization: Bearer " + Jwt.get_token(), "Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, json)
	
func put_request(url: String, json: String = "no json") -> void:
	if json != "no json":
		var headers: PackedStringArray = ["Authorization: Bearer " + Jwt.get_token(), "Content-Type: application/json"]
		$HTTPRequest.request(url, headers, HTTPClient.METHOD_PUT, json)
	else:
		var headers: PackedStringArray = ["Authorization: Bearer " + Jwt.get_token(), "Content-Length: 0"]
		$HTTPRequest.request(url, headers, HTTPClient.METHOD_PUT, "")
		

func delete_request(url: String):
	var headers: PackedStringArray = ["Authorization: Bearer " + Jwt.get_token()]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_DELETE)

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code != 200 and response_code != 201:
		# Ошибка. Заносим её в response
		Response.set_response(body.get_string_from_utf8())
		emit_signal("response_ready")
		return
	# Достаём body в виде json
	var json = body.get_string_from_utf8()
	# Парсим его в dictionary
	var parsed_data = JSON.parse_string(json)
	# Потому что JSON.parse_string возвращает null, когда парс не удался. А парс не удаётся когда в body уже лежит строка
	if parsed_data == null:
		print(json)
		Response.set_response(json)
		emit_signal("response_ready")
	else:
		print(parsed_data)
		Response.set_response(str(parsed_data))
		emit_signal("response_ready")
RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script 0   res://Scenes/RequestsWindow/RequestPerformer.gd ��������      local://PackedScene_0q3cm '         PackedScene          	         names "         Request    script    Node    HTTPRequest #   _on_http_request_request_completed    request_completed    	   variants                       node_count             nodes        ��������       ����                            ����              conn_count             conns                                      node_paths              editable_instances              version             RSRC�extends Control

func _on_logging_in_button_up() -> void:
	# Переключаемся на сцену аутентификации
	get_tree().change_scene_to_file("res://Scenes/AuthenticationWindow/AuthenticationWindow.tscn")


func _on_continue_as_guest_button_up() -> void:
	# Переходим на сцену выбора категорий (Склад, Продажи, Расходы, Статьи расходов)
	Jwt.set_token("")
	get_tree().change_scene_to_file("res://Scenes/RequestsWindow/ChooseCategory.tscn")


func _on_quit_button_up() -> void:
	# ggwp
	get_tree().quit()

# TODO:
# Класс от которого будут наследоваться http методы.
# Понять как реализовать прокручивающийся список с элементами
# Найти самый подходящий элемент для запроса
# Добавить кнопку назад
�#���Q�3��nRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script (   res://Scenes/StartWindow/StartWindow.gd ��������      local://PackedScene_hqhx8          PackedScene          	         names "         StartWindow    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    MarginContainer    offset_left    offset_top    offset_right    offset_bottom    VBoxContainer 
   LoggingIn $   theme_override_font_sizes/font_size    text    Button    ContinueAsGuest    Quit    _on_logging_in_button_up 
   button_up     _on_continue_as_guest_button_up    _on_quit_button_up    	   variants                        �?                            �C     @C    @rD     �C   @         Log in       Continue as a guest       Quit       node_count             nodes     V   ��������       ����                                                          	   	   ����         
                     	                    ����                          ����            
                          ����            
                          ����            
                   conn_count             conns                                                                                      node_paths              editable_instances              version             RSRCN�e,extends Node

# String field
var token: String = ""

# Function to set the token
func set_token(new_token: String) -> void:
	token = new_token

# Function to get the token
func get_token() -> String:
	return token
Ax����extends Node

# String field
var response: String = ""

# Function to set the response
func set_response(_response: String) -> void:
	response = _response

# Function to get the response
func get_response() -> String:
	return response
�GST2   �   �      ����               � �        &  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�4mb�h3O���$E�s����A*DV�:#�)��)�X/�x�>@\�0|�q��m֋�d�0ψ�t�!&����P2Z�z��QF+9ʿ�d0��VɬF�F� ���A�����j4BUHp�AI�r��ِ���27ݵ<�=g��9�1�e"e�{�(�(m�`Ec\]�%��nkFC��d���7<�
V�Lĩ>���Qo�<`�M�$x���jD�BfY3�37�W��%�ݠ�5�Au����WpeU+.v�mj��%' ��ħp�6S�� q��M�׌F�n��w�$$�VI��o�l��m)��Du!SZ��V@9ד]��b=�P3�D��bSU�9�B���zQmY�M~�M<��Er�8��F)�?@`�:7�=��1I]�������3�٭!'��Jn�GS���0&��;�bE�
�
5[I��=i�/��%�̘@�YYL���J�kKvX���S���	�ڊW_�溶�R���S��I��`��?֩�Z�T^]1��VsU#f���i��1�Ivh!9+�VZ�Mr�טP�~|"/���IK
g`��MK�����|CҴ�ZQs���fvƄ0e�NN�F-���FNG)��W�2�JN	��������ܕ����2
�~�y#cB���1�YϮ�h�9����m������v��`g����]1�)�F�^^]Rץ�f��Tk� s�SP�7L�_Y�x�ŤiC�X]��r�>e:	{Sm�ĒT��ubN����k�Yb�;��Eߝ�m�Us�q��1�(\�����Ӈ�b(�7�"�Yme�WY!-)�L���L�6ie��@�Z3D\?��\W�c"e���4��AǘH���L�`L�M��G$𩫅�W���FY�gL$NI�'������I]�r��ܜ��`W<ߛe6ߛ�I>v���W�!a��������M3���IV��]�yhBҴFlr�!8Մ�^Ҷ�㒸5����I#�I�ڦ���P2R���(�r�a߰z����G~����w�=C�2������C��{�hWl%��и���O������;0*��`��U��R��vw�� (7�T#�Ƨ�o7�
�xk͍\dq3a��	x p�ȥ�3>Wc�� �	��7�kI��9F}�ID
�B���
��v<�vjQ�:a�J�5L&�F�{l��Rh����I��F�鳁P�Nc�w:17��f}u}�Κu@��`� @�������8@`�
�1 ��j#`[�)�8`���vh�p� P���׷�>����"@<�����sv� ����"�Q@,�A��P8��dp{�B��r��X��3��n$�^ ��������^B9��n����0T�m�2�ka9!�2!���]
?p ZA$\S��~B�O ��;��-|��
{�V��:���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���(�#2:E(*�H���{��>��&!��$| �~�+\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j����	P:�~�G0 �J��$�M���@�Q��Yz��i��~q�1?�c��Bߝϟ�n�*������8j������p���ox���"w���r�yvz U\F8��<E��xz�i���qi����ȴ�ݷ-r`\�6����Y��q^�Lx�9���#���m����-F�F.-�a�;6��lE�Q��)�P�x�:-�_E�4~v��Z�����䷳�:�n��,㛵��m�=wz�Ξ;2-��[k~v��Ӹ_G�%*�i� ����{�%;����m��g�ez.3���{�����Kv���s �fZ!:� 4W��޵D��U��
(t}�]5�ݫ߉�~|z��أ�#%���ѝ܏x�D4�4^_�1�g���<��!����t�oV�lm�s(EK͕��K�����n���Ӌ���&�̝M�&rs�0��q��Z��GUo�]'G�X�E����;����=Ɲ�f��_0�ߝfw�!E����A[;���ڕ�^�W"���s5֚?�=�+9@��j������b���VZ^�ltp��f+����Z�6��j�`�L��Za�I��N�0W���Z����:g��WWjs�#�Y��"�k5m�_���sh\���F%p䬵�6������\h2lNs�V��#�t�� }�K���Kvzs�>9>�l�+�>��^�n����~Ěg���e~%�w6ɓ������y��h�DC���b�KG-�d��__'0�{�7����&��yFD�2j~�����ټ�_��0�#��y�9��P�?���������f�fj6͙��r�V�K�{[ͮ�;4)O/��az{�<><__����G����[�0���v��G?e��������:���١I���z�M�Wۋ�x���������u�/��]1=��s��E&�q�l�-P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸z��f��i���_�j�S-|��w�J�<LծT��-9�����I�®�6 *3��y�[�.Ԗ�K��J���<�ݿ��-t�J���E�63���1R��}Ғbꨝט�l?�#���ӴQ��.�S���U
v�&�3�&O���0�9-�O�kK��V_gn��k��U_k˂�4�9�v�I�:;�w&��Q�ҍ�
��fG��B��-����ÇpNk�sZM�s���*��g8��-���V`b����H���
3cU'0hR
�w�XŁ�K݊�MV]�} o�w�tJJ���$꜁x$��l$>�F�EF�޺�G�j�#�G�t�bjj�F�б��q:�`O�4�y�8`Av<�x`��&I[��'A�˚�5��KAn��jx ��=Kn@��t����)�9��=�ݷ�tI��d\�M�j�B�${��G����VX�V6��f�#��V�wk ��W�8�	����lCDZ���ϖ@���X��x�W�Utq�ii�D($�X��Z'8Ay@�s�<�x͡�PU"rB�Q�_�Q6  �[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://34ntr2k6armg"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 [remap]

path="res://.godot/exported/133200997/export-0d543ea52c425910f8ce7492bc358e6c-AuthenticationWindow.scn"
�e���K{.	��lL[remap]

path="res://.godot/exported/133200997/export-048b7b24a4bd58c7d827bb52577412f7-custom_theme.res"
�0�bw+[remap]

path="res://.godot/exported/133200997/export-79e710c743a3b34d96cf94ee83511ef9-charges.scn"
��$h0�m<�,[remap]

path="res://.godot/exported/133200997/export-044d6f760e8ea50029a8585d9d7fa607-ExpenseItems.scn"
�&��ʧ[remap]

path="res://.godot/exported/133200997/export-8e444d32ebeacd603bcc73eb2bfd9a8c-Sales.scn"
�\N��&g?�`y[remap]

path="res://.godot/exported/133200997/export-80c2c932599770d41837c2a6163792d4-Warehouse.scn"
x�~����W[remap]

path="res://.godot/exported/133200997/export-e51e027221664907aa8599e643b208b6-ChooseCategory.scn"
ESl��[remap]

path="res://.godot/exported/133200997/export-44da4095f26c9f3aa4facce279a123fc-RequestPerformer.scn"
�B[remap]

path="res://.godot/exported/133200997/export-1155e1cbb106903d5efb658c231616d8-StartWindow.scn"
�T��
l��<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
q   ���L;   res://Scenes/AuthenticationWindow/AuthenticationWindow.tscn!+��_3   res://Scenes/AuthenticationWindow/custom_theme.tres�B���se3   res://Scenes/RequestsWindow/Categories/charges.tscn�<�=�AC8   res://Scenes/RequestsWindow/Categories/ExpenseItems.tscn�����Ăg/   res://Scenes/RequestsWindow/ChooseCategory.tscn4p%�s��d1   res://Scenes/RequestsWindow/RequestPerformer.tscn���l+�u)   res://Scenes/StartWindow/StartWindow.tscnҁ�`�   res://icon.svg"m9���x5   res://Scenes/RequestsWindow/Categories/Warehouse.tscn���Je�E1   res://Scenes/RequestsWindow/Categories/Sales.tscn�h��P��V1   res://Scenes/RequestsWindow/Categories/Sales.tscnIECFG      application/config/name          GuitarcollectorsClient     application/run/main_scene4      )   res://Scenes/StartWindow/StartWindow.tscn      application/config/features$   "         4.0    Forward Plus       application/config/icon         res://icon.svg     autoload/Jwt         *res://src/JWT.gd      autoload/Response          *res://src/Response.gd  "   display/window/size/viewport_width         #   display/window/size/viewport_height      �  JWu|�\