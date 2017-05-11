note
	description: "DirtSphere_Eiffel_Server application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Création

	make
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
--					if attached {INTEGER} l_socket_serveur.retrieved as la_blocks then

--						create l_fichier.make_with_name ("sauvegarde")
--						if (l_fichier.exists and l_fichier.is_writable) or l_fichier.is_creatable then
--							l_fichier.open_write
--							l_fichier.independent_store (la_blocks)
--						end
--					end
					print("le client s'est connecte a moi")
					la_socket_client.close
				else
					io.error.put_string ("Erreur: Le client n'est pas valide.%N")
				end
				l_socket_serveur.close
			else
				io.error.put_string ("Erreur: Ne peut pas ouvrir le port.%N")
			end

		end

feature --Fonctions

feature -- Attributs

en_marche:BOOLEAN

end
