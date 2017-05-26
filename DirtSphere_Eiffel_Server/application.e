note
	description: "Serveur pour le jeu DirtSphere"
	date: "25/05/2017"
	revision: "0.1"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Création
	make
			-- Ouverture du serveur
		local
			l_socket_serveur:NETWORK_STREAM_SOCKET
			l_adresse_factory:INET_ADDRESS_FACTORY
			l_fichier:RAW_FILE
		do
			create l_socket_serveur.make_server_by_port (12345)
			if l_socket_serveur.is_bound then
				print("Socket ouvert sur le port 12345%N")
				l_socket_serveur.listen (1)
				l_socket_serveur.accept
				if attached l_socket_serveur.accepted as la_socket_client then
					print("le client s'est connecte a moi")
					if attached {INTEGER} l_socket_serveur.retrieved as la_blocks then
						print("recu")
--						create l_fichier.make_with_name ("sauvegarde")
--						if (l_fichier.exists and l_fichier.is_writable) or l_fichier.is_creatable then
--							l_fichier.open_write
--							l_fichier.independent_store (la_blocks)
--						end
					end
					la_socket_client.close
				else
					io.error.put_string ("Erreur: Le client n'est pas valide.%N")
				end
				l_socket_serveur.close
			else
				io.error.put_string ("Erreur: Ne peut pas ouvrir le port.%N")
			end

		end

feature -- Attributs

en_marche:BOOLEAN -- Si le serveur est en marche

invariant

note
	copyright: "Copyright (c) 2017, Olivier Letendre"
	license: "[
			 This program is free software: you can redistribute it and/or modify
			 it under the terms of the GNU General Public License as published by
			 the Free Software Foundation, either version 3 of the License, or
			 (at your option) any later version.
			 ]"
	source: "[
			Olivier Letendre
			Email MannedTooth@outlook.com
			]"
end
