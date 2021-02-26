<?php

/**
 * form data catalogue GET method sub-handler.
 * 
 * use session data:
 * user:    student id.
 */

namespace controller\from;

require_once 'model/DBAdaptor.php';
require_once 'model/Handler.php';
require_once 'model/Logger.php';
require_once 'model/Validation.php';

use model\validation as valid;

class GetCatalogueHandler extends \model\GetHandler
{
    public function Handle(): array
    {
        try {
            $this->respond['cat'] = (new \model\DBAdaptor())->obtain_catalogue($_SESSION['user']);
            $this->respond['status'] = 1;

            $this->logger->appendRecord("[{$_SESSION['user']}] obtained applied form list.");
        } catch (\model\RecordNotFoundException $rnf) {
            $this->logger->appendError($rnf);
            $this->respond['status'] = 20;
        } finally {
            return $this->respond;
        }
    }

    public function Validate(): bool
    {
        $valid = isset($_SESSION['user']);

        if (!$valid) {
            $this->respond['status'] = 14;
            $this->logger->appendRecord(
                "User [{$_SESSION['user']}] attempt to obtain applied form list, but some data invalid."
            );
        }

        return $valid;
    }
}