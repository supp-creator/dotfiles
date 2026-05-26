(use-modules (gnu home)
	    (gnu home services)
	    (gnu home services shells)
	    (gnu home services ssh)
	    (gnu home services version-control)
	    (gnu packages))

(home-environment
 (packages '())

 (services
  (list
   (service home-git-service-type
	    (home-git-configuration
	     (name "supp-creator")
	     (email "tyronesarmiento3@gmail.com")))

   (service home-openssh-service-type
	    (home-openssh-configuration
	     (hosts
	      (list
	       (openssh-host
		(name "github.com")
		(user "git")
		(identity-file "~/.ssh/id_ed25519")))))))))
	    
	    
