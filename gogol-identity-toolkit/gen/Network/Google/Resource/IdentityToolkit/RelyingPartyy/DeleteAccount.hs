{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.IdentityToolkit.RelyingPartyy.DeleteAccount
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Delete user account.
--
-- /See:/ <https://developers.google.com/identity-toolkit/v3/ Google Identity Toolkit API Reference> for @IdentitytoolkitRelyingPartyyDeleteAccount@.
module Network.Google.Resource.IdentityToolkit.RelyingPartyy.DeleteAccount
    (
    -- * REST Resource
      RelyingPartyyDeleteAccountResource

    -- * Creating a Request
    , relyingPartyyDeleteAccount'
    , RelyingPartyyDeleteAccount'

    -- * Request Lenses
    , rIdentitytoolkitRelyingPartyyDeleteAccountRequest
    , rQuotaUser
    , rPrettyPrint
    , rUserIP
    , rKey
    , rOAuthToken
    , rFields
    ) where

import           Network.Google.IdentityToolkit.Types
import           Network.Google.Prelude

-- | A resource alias for @IdentitytoolkitRelyingPartyyDeleteAccount@ which the
-- 'RelyingPartyyDeleteAccount'' request conforms to.
type RelyingPartyyDeleteAccountResource =
     "deleteAccount" :>
       QueryParam "quotaUser" Text :>
         QueryParam "prettyPrint" Bool :>
           QueryParam "userIp" Text :>
             QueryParam "key" Key :>
               QueryParam "oauth_token" OAuthToken :>
                 QueryParam "fields" Text :>
                   QueryParam "alt" AltJSON :>
                     ReqBody '[JSON]
                       IdentitytoolkitRelyingPartyyDeleteAccountRequest
                       :> Post '[JSON] DeleteAccountResponse

-- | Delete user account.
--
-- /See:/ 'relyingPartyyDeleteAccount'' smart constructor.
data RelyingPartyyDeleteAccount' = RelyingPartyyDeleteAccount'
    { _rIdentitytoolkitRelyingPartyyDeleteAccountRequest :: !IdentitytoolkitRelyingPartyyDeleteAccountRequest
    , _rQuotaUser                                        :: !(Maybe Text)
    , _rPrettyPrint                                      :: !Bool
    , _rUserIP                                           :: !(Maybe Text)
    , _rKey                                              :: !(Maybe Key)
    , _rOAuthToken                                       :: !(Maybe OAuthToken)
    , _rFields                                           :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RelyingPartyyDeleteAccount'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rIdentitytoolkitRelyingPartyyDeleteAccountRequest'
--
-- * 'rQuotaUser'
--
-- * 'rPrettyPrint'
--
-- * 'rUserIP'
--
-- * 'rKey'
--
-- * 'rOAuthToken'
--
-- * 'rFields'
relyingPartyyDeleteAccount'
    :: IdentitytoolkitRelyingPartyyDeleteAccountRequest -- ^ 'IdentitytoolkitRelyingPartyyDeleteAccountRequest'
    -> RelyingPartyyDeleteAccount'
relyingPartyyDeleteAccount' pRIdentitytoolkitRelyingPartyyDeleteAccountRequest_ =
    RelyingPartyyDeleteAccount'
    { _rIdentitytoolkitRelyingPartyyDeleteAccountRequest = pRIdentitytoolkitRelyingPartyyDeleteAccountRequest_
    , _rQuotaUser = Nothing
    , _rPrettyPrint = True
    , _rUserIP = Nothing
    , _rKey = Nothing
    , _rOAuthToken = Nothing
    , _rFields = Nothing
    }

-- | Multipart request metadata.
rIdentitytoolkitRelyingPartyyDeleteAccountRequest :: Lens' RelyingPartyyDeleteAccount' IdentitytoolkitRelyingPartyyDeleteAccountRequest
rIdentitytoolkitRelyingPartyyDeleteAccountRequest
  = lens
      _rIdentitytoolkitRelyingPartyyDeleteAccountRequest
      (\ s a ->
         s{_rIdentitytoolkitRelyingPartyyDeleteAccountRequest
             = a})

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
rQuotaUser :: Lens' RelyingPartyyDeleteAccount' (Maybe Text)
rQuotaUser
  = lens _rQuotaUser (\ s a -> s{_rQuotaUser = a})

-- | Returns response with indentations and line breaks.
rPrettyPrint :: Lens' RelyingPartyyDeleteAccount' Bool
rPrettyPrint
  = lens _rPrettyPrint (\ s a -> s{_rPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
rUserIP :: Lens' RelyingPartyyDeleteAccount' (Maybe Text)
rUserIP = lens _rUserIP (\ s a -> s{_rUserIP = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
rKey :: Lens' RelyingPartyyDeleteAccount' (Maybe Key)
rKey = lens _rKey (\ s a -> s{_rKey = a})

-- | OAuth 2.0 token for the current user.
rOAuthToken :: Lens' RelyingPartyyDeleteAccount' (Maybe OAuthToken)
rOAuthToken
  = lens _rOAuthToken (\ s a -> s{_rOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
rFields :: Lens' RelyingPartyyDeleteAccount' (Maybe Text)
rFields = lens _rFields (\ s a -> s{_rFields = a})

instance GoogleAuth RelyingPartyyDeleteAccount' where
        authKey = rKey . _Just
        authToken = rOAuthToken . _Just

instance GoogleRequest RelyingPartyyDeleteAccount'
         where
        type Rs RelyingPartyyDeleteAccount' =
             DeleteAccountResponse
        request = requestWithRoute defReq identityToolkitURL
        requestWithRoute r u RelyingPartyyDeleteAccount'{..}
          = go _rQuotaUser (Just _rPrettyPrint) _rUserIP _rKey
              _rOAuthToken
              _rFields
              (Just AltJSON)
              _rIdentitytoolkitRelyingPartyyDeleteAccountRequest
          where go
                  = clientWithRoute
                      (Proxy :: Proxy RelyingPartyyDeleteAccountResource)
                      r
                      u