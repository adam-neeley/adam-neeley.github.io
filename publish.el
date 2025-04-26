(require 'ox-publish)

(setq org-publish-project-alist
      '(

        ;; 1. Render all .org → HTML
        ("org-site"
         :base-directory       "./content/"
         :base-extension       "org"
         :publishing-directory "./public/"
         :publishing-function  org-html-publish-to-html

         :recursive            t
         :auto-preamble        t
         :auto-postamble       nil

         :with-author          t
         :with-creator         t
         :with-toc             t
         :headline-levels      4

         ;; :html-head-include-default-style nil
         :html-head-extra      "<link rel=\"stylesheet\" href=\"assets/style.css\" />"
         :html-preamble        t)

        ;; 2. Copy static assets (CSS, images, JS)
        ("org-site-static"
         :base-directory       "./assets/"
         :base-extension       "css\\|js\\|png\\|jpg\\|gif"
         :publishing-directory "./public/assets/"
         :recursive            t
         :publishing-function  org-publish-attachment)

        ;; 3. Aggregate
        ("org-site-all"
         :components ("org-site" "org-site-static"))))
